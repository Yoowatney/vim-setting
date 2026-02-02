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
# 4. System Permissions
# ===========================================
echo -e "${GREEN}4. System Permissions${NC}"
echo ""
echo "   Open: System Settings > Privacy & Security"
echo ""
echo "   Input Monitoring:"
echo "   - Karabiner-Elements"
echo "   - Karabiner-EventViewer"
echo ""
echo "   Accessibility:"
echo "   - Karabiner-Elements"
echo "   - Hammerspoon"
echo "   - Rectangle"
echo "   - Vimac"
echo "   - Snap"
echo ""
echo "   Full Disk Access (optional):"
echo "   - iTerm"
echo "   - Terminal"
echo ""

# ===========================================
# 5. App Logins
# ===========================================
echo -e "${GREEN}5. App Logins Required${NC}"
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
