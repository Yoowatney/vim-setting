#!/bin/bash
# Claude Code Notification Hook - 입력 대기/권한 요청 알림

LOG_FILE="$HOME/.claude/hooks/permission-notification-debug.log"

# stdin에서 hook input 읽기
HOOK_INPUT=$(cat)

echo "=== $(date) ===" >> "$LOG_FILE"

# message 추출
MESSAGE=$(echo "$HOOK_INPUT" | jq -r '.message // empty')
echo "MESSAGE: $MESSAGE" >> "$LOG_FILE"

# 기본 메시지
if [ -z "$MESSAGE" ]; then
    MESSAGE="입력이 필요합니다"
fi

# 80자 제한
if [ ${#MESSAGE} -gt 80 ]; then
    MESSAGE="${MESSAGE:0:77}..."
fi

echo "FINAL MESSAGE: $MESSAGE" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 사운드 먼저 재생 (백그라운드)
afplay -v 3 /System/Library/Sounds/Blow.aiff &

# 알림 표시 (클릭 시 osascript로 iTerm2 활성화)
terminal-notifier -title 'Claude Code - 입력 필요' -message "$MESSAGE" \
    -execute "osascript -e 'tell application \"iTerm\" to activate'" &

exit 0
