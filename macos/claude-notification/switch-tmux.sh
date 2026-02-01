#\!/bin/bash
LOG="/tmp/switch-tmux.log"
echo "=== $(date) ===" >> "$LOG"
echo "실행됨" >> "$LOG"

CONTEXT_FILE="/tmp/claude-code-tmux-context"

osascript -e 'tell application "iTerm" to activate'

if [ \! -f "$CONTEXT_FILE" ]; then
    echo "컨텍스트 파일 없음" >> "$LOG"
    exit 0
fi

CONTEXT=$(cat "$CONTEXT_FILE")
SESSION=$(echo "$CONTEXT" | cut -d: -f1)
WINDOW=$(echo "$CONTEXT" | cut -d: -f2)
TIMESTAMP=$(echo "$CONTEXT" | cut -d: -f3)

echo "SESSION=$SESSION, WINDOW=$WINDOW" >> "$LOG"

NOW=$(date +%s)
AGE=$((NOW - TIMESTAMP))
if [ "$AGE" -gt 300 ]; then
    echo "컨텍스트 오래됨: ${AGE}초" >> "$LOG"
    exit 0
fi

if [ -n "$SESSION" ]; then
    tmux switch-client -t "$SESSION" 2>/dev/null
    if [ -n "$WINDOW" ]; then
        tmux select-window -t "$WINDOW" 2>/dev/null
    fi
    echo "tmux 전환 완료" >> "$LOG"
fi

