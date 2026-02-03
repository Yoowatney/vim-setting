#!/bin/bash

# ===========================================
# Secrets & Manual Setup Guide
# This script provides guidance only - no automatic actions
# ===========================================

# Colors
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo ""
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Secrets & Manual Setup Guide${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# ===========================================
# 1. SSH Keys
# ===========================================
echo -e "${GREEN}1. SSH Keys${NC}"
echo ""
echo "   Copy from your backup location:"
echo ""
echo -e "   ${YELLOW}# Copy SSH directory${NC}"
echo "   cp -r /path/to/backup/.ssh ~/.ssh"
echo ""
echo -e "   ${YELLOW}# Set correct permissions${NC}"
echo "   chmod 700 ~/.ssh"
echo "   chmod 600 ~/.ssh/id_*"
echo "   chmod 644 ~/.ssh/*.pub"
echo "   chmod 644 ~/.ssh/known_hosts"
echo "   chmod 644 ~/.ssh/config"
echo ""
echo -e "   ${YELLOW}# Add to SSH agent${NC}"
echo "   ssh-add ~/.ssh/id_ed25519  # or id_rsa"
echo ""
echo -e "   ${YELLOW}# Test GitHub connection${NC}"
echo "   ssh -T git@github.com"
echo ""

# ===========================================
# 2. GPG Keys
# ===========================================
echo -e "${GREEN}2. GPG Keys${NC}"
echo ""
echo "   Export from old machine:"
echo ""
echo -e "   ${YELLOW}# Export private key (on old machine)${NC}"
echo "   gpg --export-secret-keys --armor your@email.com > private.key"
echo ""
echo "   Import on new machine:"
echo ""
echo -e "   ${YELLOW}# Import private key${NC}"
echo "   gpg --import private.key"
echo ""
echo -e "   ${YELLOW}# Trust the key${NC}"
echo "   gpg --edit-key your@email.com"
echo "   # In gpg prompt: trust → 5 → quit"
echo ""
echo -e "   ${YELLOW}# Configure git to use GPG${NC}"
echo "   git config --global user.signingkey YOUR_KEY_ID"
echo "   git config --global commit.gpgsign true"
echo ""

# ===========================================
# 3. Git Config
# ===========================================
echo -e "${GREEN}3. Git Config${NC}"
echo ""
echo -e "   ${YELLOW}# Set your identity${NC}"
echo "   git config --global user.name \"Your Name\""
echo "   git config --global user.email \"your@email.com\""
echo ""
echo -e "   ${YELLOW}# Verify${NC}"
echo "   git config --global --list"
echo ""

# ===========================================
# 4. System Permissions (중요!)
# ===========================================
echo -e "${GREEN}4. System Permissions (이거 안하면 Karabiner 안됨!)${NC}"
echo ""
echo -e "   ${YELLOW}[Step 1] 시스템 설정 열기${NC}"
echo "   - Cmd+Space → '시스템 설정' 검색 → 열기"
echo "   - 또는: 좌측상단 Apple 로고 → 시스템 설정"
echo ""
echo -e "   ${YELLOW}[Step 2] 개인정보 보호 및 보안 → 입력 모니터링${NC}"
echo "   - 왼쪽 메뉴에서 '개인정보 보호 및 보안' 클릭"
echo "   - 스크롤 내려서 '입력 모니터링' 클릭"
echo "   - 잠금 해제 (비밀번호 입력)"
echo "   - 다음 앱들 토글 ON:"
echo "     ✅ karabiner_grabber"
echo "     ✅ karabiner_observer"
echo ""
echo -e "   ${YELLOW}[Step 3] 개인정보 보호 및 보안 → 손쉬운 사용${NC}"
echo "   - '손쉬운 사용' 클릭"
echo "   - 다음 앱들 토글 ON:"
echo "     ✅ Karabiner-Elements"
echo "     ✅ Hammerspoon"
echo "     ✅ Rectangle"
echo "     ✅ Snap"
echo ""
echo -e "   ${YELLOW}[Step 4] 구름 입력기 설정${NC}"
echo "   - 시스템 설정 → 키보드 → 입력 소스 → 편집"
echo "   - '+' 버튼 → '구름' 검색 → 추가"
echo "   - 기존 '한국어' 입력기 제거 (구름만 남기기)"
echo "   - 메뉴바에서 입력기 아이콘 → 구름 선택"
echo ""
echo -e "   ${YELLOW}[완료 후] Karabiner 재시작${NC}"
echo "   - Cmd+Space → 'Karabiner-Elements' → 열기"
echo "   - 상단 메뉴 → Quit Karabiner-Elements"
echo "   - 다시 열기"
echo ""

# ===========================================
# 5. Post-Install (sudo 필요)
# ===========================================
echo -e "${GREEN}5. Post-Install (sudo 필요)${NC}"
echo ""
echo "   Docker Desktop:"
echo "   - brew install --cask docker-desktop"
echo ""

# ===========================================
# 6. App Logins
# ===========================================
echo -e "${GREEN}6. App Logins Required${NC}"
echo ""
echo "   Browser:"
echo "   - Chrome/Firefox (sync enabled)"
echo ""
echo "   Communication:"
echo "   - Slack"
echo "   - Discord"
echo "   - KakaoTalk"
echo ""
echo "   Productivity:"
echo "   - Notion"
echo "   - Todoist"
echo ""
echo "   Development:"
echo "   - GitHub CLI: gh auth login"
echo "   - Firebase CLI: firebase login"
echo "   - Vercel CLI: vercel login"
echo "   - AWS CLI: aws configure"
echo "   - GCloud CLI: gcloud auth login"
echo ""
echo "   App Store:"
echo "   - Sign in to download mas apps"
echo ""

# # ===========================================
# # 6. Optional: 1Password / Bitwarden
# # ===========================================
# echo -e "${GREEN}6. Password Manager (Optional)${NC}"
# echo ""
# echo "   If using 1Password CLI:"
# echo ""
# echo -e "   ${YELLOW}# Sign in${NC}"
# echo "   op signin"
# echo ""
# echo -e "   ${YELLOW}# SSH agent integration${NC}"
# echo "   # Add to ~/.ssh/config:"
# echo "   # Host *"
# echo "   #   IdentityAgent \"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\""
# echo ""
#
# echo -e "${BLUE}================================${NC}"
# echo ""
