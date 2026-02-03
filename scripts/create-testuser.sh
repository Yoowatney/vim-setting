#!/bin/bash

# ===========================================
# 새 macOS 테스트 유저 생성 스크립트
# Usage: sudo ./create-testuser.sh [username] [password]
# ===========================================

set -e

USERNAME="${1:-testuser}"
PASSWORD="${2:-1234}"

echo "Creating user: $USERNAME"

# 유저 생성
sudo dscl . -create /Users/$USERNAME
sudo dscl . -create /Users/$USERNAME UserShell /bin/zsh
sudo dscl . -create /Users/$USERNAME RealName "Test User"
sudo dscl . -create /Users/$USERNAME UniqueID 502
sudo dscl . -create /Users/$USERNAME PrimaryGroupID 20
sudo dscl . -create /Users/$USERNAME NFSHomeDirectory /Users/$USERNAME

# 홈 디렉토리 생성 및 권한 설정
sudo mkdir -p /Users/$USERNAME
sudo chown -R $USERNAME:staff /Users/$USERNAME
sudo chmod 755 /Users/$USERNAME

# 비밀번호 설정
sudo dscl . -passwd /Users/$USERNAME "$PASSWORD"

# admin 그룹 추가 (sudo 사용 가능)
sudo dseditgroup -o edit -a $USERNAME -t user admin

# SSH 접속 허용
sudo dseditgroup -o edit -a $USERNAME -t user com.apple.access_ssh

# SSH 키 디렉토리 설정
sudo mkdir -p /Users/$USERNAME/.ssh
sudo chmod 700 /Users/$USERNAME/.ssh
sudo chown -R $USERNAME:staff /Users/$USERNAME/.ssh

echo ""
echo "✅ User created: $USERNAME"
echo "   Password: $PASSWORD"
echo ""
echo "To add SSH key, run:"
echo "   scp ~/.ssh/id_rsa.pub <remote>:/tmp/key.pub"
echo "   sudo cp /tmp/key.pub /Users/$USERNAME/.ssh/authorized_keys"
echo "   sudo chown $USERNAME:staff /Users/$USERNAME/.ssh/authorized_keys"
echo "   sudo chmod 600 /Users/$USERNAME/.ssh/authorized_keys"
