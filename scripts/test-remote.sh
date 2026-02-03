#!/bin/bash
# 내부 테스트용 - brew 제외 홈 디렉토리 초기화 후 init.sh 실행

HOST="192.168.123.186"
USER="testuser"
PASS="1234"

expect -c "
set timeout 600
spawn ssh -t ${USER}@${HOST} \"rm -rf ~/.dotfiles ~/.config ~/.oh-my-zsh ~/.tmux ~/.local ~/.zshrc* ~/.p10k.zsh ~/.tmux.conf* ~/.hammerspoon ~/.claude ~/.fzf.zsh 2>/dev/null && git clone https://github.com/Yoowatney/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./init.sh\"
expect {
    \"password:\" { send \"${PASS}\r\"; exp_continue }
    \"Password:\" { send \"${PASS}\r\"; exp_continue }
    timeout { puts \"TIMEOUT\"; exit 1 }
    eof
}
"
