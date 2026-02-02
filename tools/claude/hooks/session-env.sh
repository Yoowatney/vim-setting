#!/bin/bash

# Claude Code SessionStart hook - direnv 환경변수 로드
# 현재 디렉토리의 .envrc를 읽어서 CLAUDE_ENV_FILE에 추가

if [ -n "$CLAUDE_ENV_FILE" ]; then
  # direnv export로 환경변수 가져오기 (export 줄만 필터링)
  direnv export bash 2>/dev/null | grep '^export ' >> "$CLAUDE_ENV_FILE"
fi

exit 0
