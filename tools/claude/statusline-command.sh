#!/bin/bash
# Claude Code Statusline with API Quota
# Shows: user@host:dir (branch) [model | 5h:X% 7d:Y%]

# Read input from stdin
input=$(cat)

# Debug: Save input to file
echo "$input" >/tmp/statusline-debug.json

# Extract basic info
current_dir="$(echo "$input" | jq -r '.workspace.current_dir // .cwd')"
model="$(echo "$input" | jq -r '.model.display_name')"

# Get git branch
git_branch="$(cd "$current_dir" 2>/dev/null && git branch --show-current 2>/dev/null || echo '')"

# Build prompt parts
username="$(whoami)"
hostname="$(hostname -s)"
dir_name="$(basename "$current_dir")"

if [ -n "$git_branch" ]; then
	git_info=" ($git_branch)"
else
	git_info=""
fi

# Get gcloud project (cached)
GCLOUD_CACHE="/tmp/claude-gcloud-cache"
GCLOUD_CACHE_AGE=300 # 5분 캐시
gcloud_project=""
if [ -f "$GCLOUD_CACHE" ]; then
	cache_age=$(($(date +%s) - $(stat -f %m "$GCLOUD_CACHE" 2>/dev/null || echo 0)))
	if [ "$cache_age" -lt "$GCLOUD_CACHE_AGE" ]; then
		gcloud_project=$(cat "$GCLOUD_CACHE")
	fi
fi
if [ -z "$gcloud_project" ]; then
	gcloud_project=$(gcloud config get-value project 2>/dev/null)
	echo "$gcloud_project" > "$GCLOUD_CACHE"
fi

# gcloud project 표시 (production이면 경고)
if [ -n "$gcloud_project" ]; then
	if echo "$gcloud_project" | grep -q "f06c6"; then
		gcloud_info=" 🔴 ${gcloud_project}"
	else
		gcloud_info=" ☁️ ${gcloud_project}"
	fi
else
	gcloud_info=""
fi

# Function to get API quota from Anthropic OAuth API
get_api_quota() {
	# Get OAuth token from Keychain
	local creds
	creds=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null)
	if [ -z "$creds" ]; then
		echo ""
		return
	fi

	local token
	token=$(echo "$creds" | jq -r '.claudeAiOauth.accessToken' 2>/dev/null)
	if [ -z "$token" ] || [ "$token" = "null" ]; then
		echo ""
		return
	fi

	# Call Anthropic OAuth API
	local response
	response=$(curl -s --max-time 2 "https://api.anthropic.com/api/oauth/usage" \
		-H "Accept: application/json" \
		-H "Content-Type: application/json" \
		-H "User-Agent: claude-code/2.0.76" \
		-H "Authorization: Bearer $token" \
		-H "anthropic-beta: oauth-2025-04-20" 2>/dev/null)

	# Check for error
	if echo "$response" | jq -e '.error' >/dev/null 2>&1; then
		echo ""
		return
	fi

	# Extract utilization values
	local five_hour seven_day
	five_hour=$(echo "$response" | jq -r '.five_hour.utilization // empty' 2>/dev/null)
	seven_day=$(echo "$response" | jq -r '.seven_day.utilization // empty' 2>/dev/null)

	if [ -n "$five_hour" ] && [ -n "$seven_day" ]; then
		# Round to integer (round half up - same as JavaScript Math.round)
		five_hour_int=$(awk "BEGIN {print int($five_hour + 0.5)}" 2>/dev/null || echo "${five_hour%.*}")
		seven_day_int=$(awk "BEGIN {print int($seven_day + 0.5)}" 2>/dev/null || echo "${seven_day%.*}")
		echo "5h:${five_hour_int}% 7d:${seven_day_int}%"
	else
		echo ""
	fi
}

# Try to get API quota (with caching to avoid slow requests)
CACHE_FILE="/tmp/claude-quota-cache"
CACHE_MAX_AGE=60 # Cache for 60 seconds

quota_info=""
if [ -f "$CACHE_FILE" ]; then
	cache_age=$(($(date +%s) - $(stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0)))
	if [ "$cache_age" -lt "$CACHE_MAX_AGE" ]; then
		quota_info=$(cat "$CACHE_FILE")
	fi
fi

if [ -z "$quota_info" ]; then
	quota_info=$(get_api_quota)
	if [ -n "$quota_info" ]; then
		echo "$quota_info" >"$CACHE_FILE"
	fi
fi

# Build status info
if [ -n "$quota_info" ]; then
	status_info="$model | $quota_info"
else
	# Fallback to context window usage
	size=$(echo "$input" | jq -r '.context_window.context_window_size // 0')
	usage=$(echo "$input" | jq '.context_window.current_usage')

	ctx_pct=""
	if [ "$size" != "null" ] && [ "$size" != "0" ] && [ -n "$size" ] 2>/dev/null; then
		size_num=$((size))
		if [ "$size_num" -gt 0 ] 2>/dev/null; then
			current=0
			if [ "$usage" != "null" ] && [ -n "$usage" ]; then
				current=$(echo "$usage" | jq -r '(.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0)')
			fi
			if [ "$current" != "null" ] && [ "$current" != "0" ] && [ -n "$current" ] 2>/dev/null; then
				current_num=$((current))
				if [ "$current_num" -gt 0 ] 2>/dev/null; then
					pct=$((current_num * 100 / size_num))
					ctx_pct=" ctx:${pct}%"
				fi
			fi
		fi
	fi
	status_info="$model$ctx_pct"
fi

# Output statusline
printf "%s@%s:%s%s%s [%s]" \
	"$username" "$hostname" "$dir_name" "$git_info" "$gcloud_info" "$status_info"
