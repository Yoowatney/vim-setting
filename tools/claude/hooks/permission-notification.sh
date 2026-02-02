#!/bin/bash
# Claude Code Notification Hook - 입력 대기/권한 요청 알림 (Hammerspoon)

LOG_FILE="$HOME/.claude/hooks/permission-notification-debug.log"
CONTEXT_FILE="/tmp/claude-code-tmux-context"

# stdin에서 hook input 읽기
HOOK_INPUT=$(cat)

echo "=== $(date) ===" >> "$LOG_FILE"

# tmux 컨텍스트 저장 (세션:윈도우:타임스탬프)
if [ -n "$TMUX" ]; then
    SESSION=$(tmux display-message -p '#S')
    WINDOW=$(tmux display-message -p '#I')
    TIMESTAMP=$(date +%s)
    echo "${SESSION}:${WINDOW}:${TIMESTAMP}" > "$CONTEXT_FILE"
    echo "TMUX CONTEXT: ${SESSION}:${WINDOW}" >> "$LOG_FILE"
fi

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

# Hammerspoon으로 알림 (클릭 시 tmux 세션 이동)
ESCAPED_MESSAGE=$(echo "$MESSAGE" | sed "s/'/\\\\'/g")
/opt/homebrew/bin/hs -c "claudeNotifyInput('$ESCAPED_MESSAGE')" &

exit 0
