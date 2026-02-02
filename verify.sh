#!/bin/bash

# ===========================================
# dotfiles verification script
# Verifies all components are installed correctly
# ===========================================

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
PREFS="$HOME/Library/Preferences"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

PASS=0
FAIL=0
WARN=0

check() {
    local name="$1"
    local condition="$2"

    if eval "$condition"; then
        echo -e "  ${GREEN}✅${NC} $name"
        ((PASS++))
    else
        echo -e "  ${RED}❌${NC} $name"
        ((FAIL++))
    fi
}

check_warn() {
    local name="$1"
    local condition="$2"
    local hint="$3"

    if eval "$condition"; then
        echo -e "  ${GREEN}✅${NC} $name"
        ((PASS++))
    else
        echo -e "  ${YELLOW}⚠️${NC}  $name"
        [[ -n "$hint" ]] && echo -e "      ${YELLOW}→ $hint${NC}"
        ((WARN++))
    fi
}

echo ""
echo "================================"
echo "  dotfiles verification"
echo "================================"
echo ""

# ===========================================
# 1. Homebrew
# ===========================================
echo "📦 Homebrew"
check "brew installed" "command -v brew &>/dev/null"
check "Brewfile exists" "[[ -f '$DOTFILES/Brewfile' ]]"

# ===========================================
# 2. Shell
# ===========================================
echo ""
echo "🐚 Shell"
check "zsh installed" "command -v zsh &>/dev/null"
check "Oh-My-Zsh installed" "[[ -d '$HOME/.oh-my-zsh' ]]"
check "Powerlevel10k installed" "[[ -d '$HOME/.oh-my-zsh/custom/themes/powerlevel10k' ]]"
check ".zshrc symlink" "[[ -L '$HOME/.zshrc' ]]"
check ".p10k.zsh symlink" "[[ -L '$HOME/.p10k.zsh' ]]"

# ===========================================
# 3. Tmux
# ===========================================
echo ""
echo "🖥️  Tmux"
check "tmux installed" "command -v tmux &>/dev/null"
check "gpakosz/.tmux installed" "[[ -d '$HOME/.tmux' ]]"
check "TPM installed" "[[ -d '$HOME/.tmux/plugins/tpm' ]]"
check ".tmux.conf.local symlink" "[[ -L '$HOME/.tmux.conf.local' ]]"
check_warn "Tmux plugins installed" "[[ -d '$HOME/.tmux/plugins/tmux-resurrect' ]]" "Run: ~/.tmux/plugins/tpm/bin/install_plugins"

# ===========================================
# 4. Neovim
# ===========================================
echo ""
echo "📝 Neovim"
check "nvim installed" "command -v nvim &>/dev/null"
check "nvim config symlink" "[[ -L '$CONFIG/nvim' ]]"
check_warn "LazyVim plugins" "[[ -d '$HOME/.local/share/nvim/lazy' ]]" "Run: nvim --headless '+Lazy! sync' +qa"

# ===========================================
# 5. Git Tools
# ===========================================
echo ""
echo "🔧 Git Tools"
check "git installed" "command -v git &>/dev/null"
check "lazygit installed" "command -v lazygit &>/dev/null"
check "lazygit config symlink" "[[ -L '$HOME/Library/Application Support/lazygit/config.yml' ]]"
check "gh installed" "command -v gh &>/dev/null"
check "delta installed" "command -v delta &>/dev/null"
check "delta git config" "[[ \$(git config --global core.pager) == 'delta' ]]"

# ===========================================
# 6. Development Tools
# ===========================================
echo ""
echo "⚙️  Development Tools"
check "mise installed" "command -v mise &>/dev/null"
check "mise config symlink" "[[ -L '$CONFIG/mise/config.toml' ]]"
check_warn "node installed (mise)" "command -v node &>/dev/null" "Run: mise install"
check_warn "python installed (mise)" "command -v python &>/dev/null" "Run: mise install"
check "fzf installed" "command -v fzf &>/dev/null"
check_warn "fzf key-bindings" "[[ -f '$HOME/.fzf.zsh' ]]" "Run: /opt/homebrew/opt/fzf/install"
check "ripgrep installed" "command -v rg &>/dev/null"
check "fd installed" "command -v fd &>/dev/null"
check "bat installed" "command -v bat &>/dev/null"
check "uv installed" "command -v uv &>/dev/null"

# ===========================================
# 7. Karabiner
# ===========================================
echo ""
echo "⌨️  Karabiner"
check "karabiner symlink" "[[ -L '$CONFIG/karabiner' ]]"
check "karabiner.json exists" "[[ -f '$CONFIG/karabiner/karabiner.json' ]]"

# ===========================================
# 8. Hammerspoon
# ===========================================
echo ""
echo "🔨 Hammerspoon"
check "hammerspoon installed" "[[ -d '/Applications/Hammerspoon.app' ]] || command -v hs &>/dev/null"
check "init.lua symlink" "[[ -L '$HOME/.hammerspoon/init.lua' ]]"
check "Spoons symlink" "[[ -L '$HOME/.hammerspoon/Spoons' ]]"

# ===========================================
# 9. Claude Code
# ===========================================
echo ""
echo "🤖 Claude Code"
check "claude installed" "command -v claude &>/dev/null"
check "settings.json exists" "[[ -f '$HOME/.claude/settings.json' ]]"
check "statusline symlink" "[[ -L '$HOME/.claude/statusline-command.sh' ]]"
check "stop-notification.sh symlink" "[[ -L '$HOME/.claude/hooks/stop-notification.sh' ]]"
check "permission-notification.sh symlink" "[[ -L '$HOME/.claude/hooks/permission-notification.sh' ]]"
check "session-env.sh symlink" "[[ -L '$HOME/.claude/hooks/session-env.sh' ]]"

# ===========================================
# 10. macOS App Settings
# ===========================================
echo ""
echo "🍎 macOS App Settings"

declare -a apps=(
    "com.knollsoft.Rectangle.plist:Rectangle"
    "com.iktm.snap.plist:Snap"
    "com.clipy-app.Clipy.plist:Clipy"
    "dexterleng.vimac.plist:Vimac"
    "com.dwarvesf.VimMotion.plist:VimMotion"
    "org.youknowone.Gureum.plist:Gureum"
    "com.apphousekitchen.aldente-pro.plist:AlDente"
    "wang.jianing.app.OpenInTerminal-Lite.plist:OpenInTerminal"
    "com.izual.Easydict.plist:Easydict"
    "com.googlecode.iterm2.plist:iTerm2"
)

for app_info in "${apps[@]}"; do
    IFS=':' read -r plist_name app_name <<< "$app_info"
    check_warn "$app_name plist" "[[ -f '$PREFS/$plist_name' ]]" "Run init.sh to restore"
done

# ===========================================
# 11. System Permissions (informational)
# ===========================================
echo ""
echo "🔐 System Permissions Required"
echo -e "  ${YELLOW}ℹ️${NC}  Grant in System Settings > Privacy & Security > Accessibility:"
echo "      - Karabiner-Elements (Input Monitoring + Accessibility)"
echo "      - Hammerspoon"
echo "      - Rectangle"
echo "      - Vimac"

# ===========================================
# Summary
# ===========================================
echo ""
echo "================================"
echo "  Summary"
echo "================================"
echo ""
echo -e "  ${GREEN}✅ Passed:${NC}  $PASS"
echo -e "  ${RED}❌ Failed:${NC}  $FAIL"
echo -e "  ${YELLOW}⚠️  Warnings:${NC} $WARN"
echo ""

if [[ $FAIL -eq 0 ]]; then
    echo -e "${GREEN}All checks passed!${NC}"
    exit 0
else
    echo -e "${YELLOW}Some checks failed. Review the output above.${NC}"
    exit 1
fi
