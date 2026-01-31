#!/bin/bash
# Claude Code Stop Hook - 작업 완료 알림 with 요약

LOG_FILE="$HOME/.claude/hooks/stop-hook-debug.log"

# stdin에서 hook input 읽기
HOOK_INPUT=$(cat)

echo "=== $(date) ===" >> "$LOG_FILE"

# transcript_path 추출
TRANSCRIPT_PATH=$(echo "$HOOK_INPUT" | jq -r '.transcript_path // empty')
echo "TRANSCRIPT_PATH: $TRANSCRIPT_PATH" >> "$LOG_FILE"

# 기본 메시지
MESSAGE="작업이 완료되었습니다"

# transcript 파일이 있으면 마지막 응답에서 요약 추출
if [ -n "$TRANSCRIPT_PATH" ] && [ -f "$TRANSCRIPT_PATH" ]; then
    # macOS: tail -r (tac 대신), 마지막 assistant text 추출 (최대 80자)
    SUMMARY=$(tail -r "$TRANSCRIPT_PATH" 2>/dev/null | \
        jq -r 'select(.type == "assistant" and .message.type == "message") | .message.content[] | select(.type == "text") | .text // empty' 2>/dev/null | \
        head -1 | \
        sed 's/^[[:space:]]*//' | \
        tr '\n' ' ' | \
        cut -c1-80)

    echo "SUMMARY: $SUMMARY" >> "$LOG_FILE"

    if [ -n "$SUMMARY" ]; then
        MESSAGE="$SUMMARY"
        # 80자 넘으면 ... 추가
        ORIGINAL_LEN=$(tail -r "$TRANSCRIPT_PATH" 2>/dev/null | \
            jq -r 'select(.type == "assistant" and .message.type == "message") | .message.content[] | select(.type == "text") | .text // empty' 2>/dev/null | \
            head -1 | wc -c)
        if [ "$ORIGINAL_LEN" -gt 80 ]; then
            MESSAGE="${MESSAGE}..."
        fi
    fi
fi

echo "FINAL MESSAGE: $MESSAGE" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 알림 표시 + 사운드 재생 (클릭 시 iTerm2 활성화)
terminal-notifier -title 'Claude Code' -message "$MESSAGE" \
    -execute "osascript -e 'tell application \"iTerm\" to activate'" &
afplay -v 3 /System/Library/Sounds/Glass.aiff

exit 0
