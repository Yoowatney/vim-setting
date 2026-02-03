#!/bin/bash
# 원격 맥북에 dotfiles 설치
# 사용법: ./init-remote.sh <IP> <USER> [PASSWORD]

HOST="${1:-}"
USER="${2:-yoyoo}"
PASS="${3:-}"

if [[ -z "$HOST" ]]; then
    echo "사용법: ./init-remote.sh <IP주소> [유저명] [비밀번호]"
    echo "예시: ./init-remote.sh 192.168.0.10 yoyoo"
    exit 1
fi

if [[ -z "$PASS" ]]; then
    echo -n "비밀번호: "
    read -rs PASS
    echo ""
fi

echo "🚀 ${USER}@${HOST} 에 dotfiles 설치 시작..."
echo ""

expect -c "
set timeout 1200
spawn ssh -t ${USER}@${HOST} \"git clone https://github.com/Yoowatney/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./init.sh\"
expect {
    \"yes/no\" { send \"yes\r\"; exp_continue }
    \"password:\" { send \"${PASS}\r\"; exp_continue }
    \"Password:\" { send \"${PASS}\r\"; exp_continue }
    timeout { puts \"TIMEOUT\"; exit 1 }
    eof
}
"

echo ""
echo "✅ 완료!"
