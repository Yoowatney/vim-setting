#!/bin/bash

# Claude Code SessionStart hook - direnv + mise 환경변수 로드

if [ -n "$CLAUDE_ENV_FILE" ]; then
  # direnv export로 환경변수 가져오기
  direnv export bash 2>/dev/null | grep '^export ' >> "$CLAUDE_ENV_FILE"

  # mise 도구 경로를 기존 PATH 앞에 추가 (PATH 덮어쓰기 방지)
  MISE_PATHS=$(mise env 2>/dev/null | grep '^export PATH=' | sed "s/export PATH='//" | sed "s/'$//" | tr ':' '\n' | grep mise | tr '\n' ':' | sed 's/:$//')
  if [ -n "$MISE_PATHS" ]; then
    echo "export PATH=\"$MISE_PATHS:\$PATH\"" >> "$CLAUDE_ENV_FILE"
  fi
fi

exit 0
