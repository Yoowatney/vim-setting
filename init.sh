#!/bin/bash

# ===========================================
# dotfiles init script
# Complete macOS development environment setup
# ===========================================

set -e

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
PREFS="$HOME/Library/Preferences"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }
step() { echo -e "\n${BLUE}=== $1 ===${NC}"; }

# Helper: create symlink with backup
# 기존 심볼릭 링크가 잘못된 경로를 가리키면 재생성
create_symlink() {
    local src="$1"
    local dest="$2"
    local name="$3"

    if [[ -L "$dest" ]]; then
        local current_target
        current_target=$(readlink "$dest")
        if [[ "$current_target" == "$src" ]]; then
            info "$name symlink OK"
        else
            warn "$name symlink points to wrong path, recreating..."
            rm -f "$dest"
            ln -s "$src" "$dest"
            info "$name symlink fixed"
        fi
    elif [[ -e "$dest" ]]; then
        warn "$name exists, backing up to ${dest}.bak..."
        mv "$dest" "${dest}.bak"
        ln -s "$src" "$dest"
        info "$name symlink created"
    else
        ln -s "$src" "$dest"
        info "$name symlink created"
    fi
}

# ===========================================
# 1. Homebrew
# ===========================================
install_homebrew() {
    step "1/15 Homebrew"
    if ! command -v brew &> /dev/null; then
        info "Installing Homebrew..."
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Apple Silicon PATH
        if [[ $(uname -m) == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    else
        info "Homebrew already installed"
    fi
}

install_packages() {
    step "2/15 Homebrew Packages (brew & cask)"
    if [[ -f "$DOTFILES/Brewfile" ]]; then
        # mas 제외하고 설치 (brew, cask, tap만)
        grep -v "^mas " "$DOTFILES/Brewfile" | brew bundle --file=- || {
            warn "Some packages failed to install"
        }
    else
        warn "Brewfile not found, skipping..."
    fi

    # Nerd Font 링크 (brew cask가 ~/Library/Fonts에 링크 안 할 때 대비)
    local font_cask="/opt/homebrew/Caskroom/font-hack-nerd-font"
    if [[ -d "$font_cask" ]]; then
        local font_version
        font_version=$(ls "$font_cask" | head -1)
        if [[ -n "$font_version" ]]; then
            mkdir -p "$HOME/Library/Fonts"
            ln -sf "$font_cask/$font_version"/*.ttf "$HOME/Library/Fonts/" 2>/dev/null || true
            info "Hack Nerd Font linked to ~/Library/Fonts"
        fi
    fi
}

install_mas_apps() {
    step "2.5/15 Mac App Store Apps"

    # SSH 환경이면 스킵 (GUI 필요)
    if [[ -n "$SSH_TTY" ]] || [[ -n "$SSH_CONNECTION" ]]; then
        warn "SSH session detected, skipping mas apps (run manually after GUI login)"
        return
    fi

    # mas 앱이 Brewfile에 있는지 확인
    if ! grep -q "^mas " "$DOTFILES/Brewfile" 2>/dev/null; then
        info "No mas apps in Brewfile, skipping..."
        return
    fi

    # App Store 로그인 체크
    if ! mas account &>/dev/null; then
        echo ""
        echo -e "${YELLOW}  ⚠️  App Store 로그인이 필요합니다.${NC}"
        echo -e "${YELLOW}  → App Store 앱에서 로그인 후 Enter를 눌러주세요.${NC}"
        echo ""

        # App Store 열기
        open -a "App Store"

        # 사용자 확인 대기
        read -r -p "  로그인 완료 후 Enter: "
        info "App Store 로그인 진행"
    else
        info "App Store 로그인됨: $(mas account)"
    fi

    # mas 앱만 설치
    grep "^mas " "$DOTFILES/Brewfile" | brew bundle --file=- || {
        warn "Some App Store apps failed to install"
    }
}

# ===========================================
# 2. Oh-My-Zsh
# ===========================================
install_ohmyzsh() {
    step "3/15 Oh-My-Zsh"
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        info "Installing Oh-My-Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        info "Oh-My-Zsh already installed"
    fi
}

install_zsh_plugins() {
    step "4/15 Zsh Plugins"
    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    # Powerlevel10k
    if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
    fi

    # zsh-autosuggestions
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    # zsh-syntax-highlighting
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi

    # zsh-completions
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]]; then
        git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
    fi

    info "Zsh plugins installed"
}

# ===========================================
# 3. Tmux (gpakosz/.tmux)
# ===========================================
install_tmux() {
    step "5/15 Tmux + TPM"
    if [[ ! -d "$HOME/.tmux" ]]; then
        info "Installing gpakosz/.tmux..."
        git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"
        ln -sf "$HOME/.tmux/.tmux.conf" "$HOME/.tmux.conf"
    else
        info "gpakosz/.tmux already installed"
    fi

    # TPM (Tmux Plugin Manager)
    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        info "Installing TPM..."
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi
}

# ===========================================
# 4. Symlinks
# ===========================================
create_symlinks() {
    step "6/15 Symlinks"

    mkdir -p "$CONFIG"

    # Neovim
    create_symlink "$DOTFILES/editors/nvim" "$CONFIG/nvim" "nvim"

    # Zsh
    create_symlink "$DOTFILES/shell/zsh/zshrc" "$HOME/.zshrc" ".zshrc"
    create_symlink "$DOTFILES/shell/zsh/p10k.zsh" "$HOME/.p10k.zsh" ".p10k.zsh"

    # Tmux local config
    create_symlink "$DOTFILES/terminal/tmux/tmux.conf.local" "$HOME/.tmux.conf.local" ".tmux.conf.local"

    # Lazygit (macOS uses ~/Library/Application Support/)
    LAZYGIT_DIR="$HOME/Library/Application Support/lazygit"
    mkdir -p "$LAZYGIT_DIR"
    create_symlink "$DOTFILES/git/lazygit/config.yml" "$LAZYGIT_DIR/config.yml" "lazygit config"

    # Mise
    mkdir -p "$CONFIG/mise"
    create_symlink "$DOTFILES/tools/mise/config.toml" "$CONFIG/mise/config.toml" "mise config"

    # Karabiner
    create_symlink "$DOTFILES/macos/karabiner" "$CONFIG/karabiner" "karabiner"

    # Hammerspoon
    mkdir -p "$HOME/.hammerspoon"
    create_symlink "$DOTFILES/macos/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua" "hammerspoon init.lua"
    create_symlink "$DOTFILES/macos/hammerspoon/Spoons" "$HOME/.hammerspoon/Spoons" "hammerspoon Spoons"

    # Git config (user info 제외)
    if [[ -f "$DOTFILES/git/gitconfig" ]]; then
        git config --global push.default current
        git config --global init.defaultBranch main
        git config --global core.pager delta
        git config --global interactive.diffFilter "delta --color-only"
        git config --global delta.navigate true
        git config --global delta.side-by-side true
        git config --global delta.line-numbers true
        git config --global alias.cleanup '!git fetch --prune && git branch -vv | grep '"'"': gone]'"'"' | awk '"'"'{print $1}'"'"' | xargs -r git branch -D'
        info "Git config applied (run: git config --global user.name/email)"
    fi

    # GitHub CLI credential helper
    if command -v gh &> /dev/null; then
        gh auth setup-git 2>/dev/null || true
        info "GitHub CLI credential helper configured"
    fi

    info "All symlinks created"
}

# ===========================================
# 5. Claude Code Setup
# ===========================================
setup_claude() {
    step "7/15 Claude Code"

    CLAUDE_DIR="$HOME/.claude"
    CLAUDE_HOOKS="$CLAUDE_DIR/hooks"

    mkdir -p "$CLAUDE_DIR"
    mkdir -p "$CLAUDE_HOOKS"

    # settings.json (copy, not symlink - has dynamic data)
    if [[ ! -f "$CLAUDE_DIR/settings.json" ]]; then
        if [[ -f "$DOTFILES/tools/claude/settings.json" ]]; then
            cp "$DOTFILES/tools/claude/settings.json" "$CLAUDE_DIR/settings.json"
            info "Claude settings.json copied"
        fi
    else
        warn "Claude settings.json exists, skipping..."
    fi

    # statusline-command.sh symlink
    create_symlink "$DOTFILES/tools/claude/statusline-command.sh" "$CLAUDE_DIR/statusline-command.sh" "Claude statusline"

    # hooks symlinks (all files)
    for hook in "$DOTFILES/tools/claude/hooks"/*.sh; do
        if [[ -f "$hook" ]]; then
            hook_name=$(basename "$hook")
            create_symlink "$hook" "$CLAUDE_HOOKS/$hook_name" "Claude hook: $hook_name"
        fi
    done

    info "Claude Code setup complete"
}

# ===========================================
# 6. macOS App Settings (plist restore)
# ===========================================
restore_app_settings() {
    step "8/15 macOS App Settings"

    # App settings mapping: "xml_path:plist_name:app_name"
    declare -a apps=(
        "macos/rectangle/rectangle.xml:com.knollsoft.Rectangle.plist:Rectangle"
        "macos/snap/snap.xml:com.iktm.snap.plist:Snap"
        "macos/clipy/clipy.xml:com.clipy-app.Clipy.plist:Clipy"
        "macos/gureum/gureum.xml:org.youknowone.Gureum.plist:Gureum"
        "macos/aldente/aldente.xml:com.apphousekitchen.aldente-pro.plist:AlDente"
        "macos/openinterminal/openinterminal.xml:wang.jianing.app.OpenInTerminal-Lite.plist:OpenInTerminal"
        "macos/easydict/easydict.xml:com.izual.Easydict.plist:Easydict"
        "macos/dock/dock.xml:com.apple.dock.plist:Dock"
        "terminal/iterm2/iterm2-settings.xml:com.googlecode.iterm2.plist:iTerm2"
    )

    for app_info in "${apps[@]}"; do
        IFS=':' read -r xml_path plist_name app_name <<< "$app_info"
        xml_file="$DOTFILES/$xml_path"
        plist_file="$PREFS/$plist_name"

        if [[ -f "$xml_file" ]]; then
            # Check if app is running
            if pgrep -x "$app_name" > /dev/null 2>&1; then
                warn "$app_name is running. Settings may not apply until restart."
            fi

            # Backup existing plist if exists
            if [[ -f "$plist_file" ]]; then
                cp "$plist_file" "${plist_file}.bak" 2>/dev/null || true
            fi

            # Convert XML to binary plist
            plutil -convert binary1 "$xml_file" -o "$plist_file"
            info "$app_name settings restored"
        else
            warn "$app_name XML not found: $xml_file"
        fi
    done

    # Dock 설정 적용을 위해 재시작
    killall Dock 2>/dev/null || true

    info "App settings restored. Restart apps to apply changes."
}

# ===========================================
# 7. macOS Defaults
# ===========================================
configure_macos_defaults() {
    step "9/15 macOS Defaults"
    if [[ -f "$DOTFILES/macos/defaults.sh" ]]; then
        bash "$DOTFILES/macos/defaults.sh"
    else
        warn "defaults.sh not found, skipping..."
    fi
}

# ===========================================
# 8. Mise Install
# ===========================================
install_mise_tools() {
    step "11/15 Mise Tools"

    # brew PATH 설정 (Apple Silicon)
    if [[ -x "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    if command -v mise &> /dev/null; then
        info "Installing mise tools (node, python, terraform, etc.)..."
        mise trust "$CONFIG/mise/config.toml" 2>/dev/null || true
        mise install --yes
        info "Mise tools installed"
    else
        warn "mise not found, skipping..."
    fi
}

# ===========================================
# 10. Neovim Plugins
# ===========================================
install_nvim_plugins() {
    step "12/15 Neovim Plugins"

    if command -v nvim &> /dev/null; then
        info "Installing Neovim plugins..."
        # 타임아웃 60초 (codeium 등 인증 필요한 플러그인 hang 방지)
        ( nvim --headless "+Lazy! sync" +qa 2>/dev/null ) &
        local nvim_pid=$!
        ( sleep 60 && kill -9 $nvim_pid 2>/dev/null ) &
        local timeout_pid=$!
        wait $nvim_pid 2>/dev/null || true
        kill $timeout_pid 2>/dev/null || true
        info "Neovim plugins installed (codeium 등은 GUI에서 인증 필요)"
    else
        warn "nvim not found, skipping..."
    fi
}

# ===========================================
# 11. Tmux Plugins
# ===========================================
install_tmux_plugins() {
    step "13/15 Tmux Plugins"

    if [[ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]]; then
        info "Installing Tmux plugins..."

        # TPM은 tmux 설정 파일에서 플러그인 목록을 읽으므로 먼저 설정 로드 필요
        tmux start-server 2>/dev/null || true
        tmux source-file ~/.tmux.conf 2>/dev/null || true

        # TPM 플러그인 설치
        "$HOME/.tmux/plugins/tpm/bin/install_plugins" || {
            warn "TPM plugin install failed (run tmux and press prefix + I)"
        }
        info "Tmux plugins installed"
    else
        warn "TPM not found, skipping..."
    fi
}

# ===========================================
# 12. Post Install
# ===========================================
post_install() {
    step "14/15 Post Install"

    # Change default shell to zsh
    if [[ "$SHELL" != *"zsh"* ]]; then
        info "Changing default shell to zsh..."
        chsh -s $(which zsh)
    fi

    # Install fzf key bindings
    if [[ -f "/opt/homebrew/opt/fzf/install" ]]; then
        /opt/homebrew/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
    fi

    # 설정 복원된 앱들 + 권한 필요한 앱들 실행
    info "Starting apps (plist 적용 + 권한 요청)..."
    echo ""
    echo -e "${YELLOW}  ⚠️  앱들이 실행됩니다. 권한 요청이 뜨면 '허용'을 눌러주세요!${NC}"
    echo ""

    # 권한 필요 앱들
    [[ -d "/Applications/Karabiner-Elements.app" ]] && open -a "Karabiner-Elements" && info "Karabiner-Elements 실행됨"
    [[ -d "/Applications/Hammerspoon.app" ]] && open -a "Hammerspoon" && info "Hammerspoon 실행됨"
    [[ -d "/Applications/Rectangle.app" ]] && open -a "Rectangle" && info "Rectangle 실행됨"
    [[ -d "/Applications/Snap.app" ]] && open -a "Snap" && info "Snap 실행됨"

    # plist 복원된 앱들
    [[ -d "/Applications/Clipy.app" ]] && open -a "Clipy" && info "Clipy 실행됨"
    [[ -d "/Applications/AlDente.app" ]] && open -a "AlDente" && info "AlDente 실행됨"
    [[ -d "/Applications/OpenInTerminal-Lite.app" ]] && open -a "OpenInTerminal-Lite" && info "OpenInTerminal 실행됨"
    [[ -d "/Applications/Easydict.app" ]] && open -a "Easydict" && info "Easydict 실행됨"
    [[ -d "/Applications/iTerm.app" ]] && open -a "iTerm" && info "iTerm 실행됨"

    sleep 2
    echo ""
    echo -e "${YELLOW}  💡 권한 설정: 시스템 설정 > 개인정보 보호 및 보안 > 입력 모니터링 / 손쉬운 사용${NC}"
    echo -e "${YELLOW}  💡 구름 설정: 시스템 설정 > 키보드 > 입력 소스 > 구름 추가${NC}"
    echo ""
}

# ===========================================
# 13. Verification
# ===========================================
run_verification() {
    step "15/15 Verification"

    if [[ -x "$DOTFILES/verify.sh" ]]; then
        bash "$DOTFILES/verify.sh"
    else
        warn "verify.sh not found, skipping verification..."
    fi
}

# ===========================================
# 14. Secrets Guide
# ===========================================
show_secrets_guide() {
    echo ""
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  Manual Setup Required${NC}"
    echo -e "${BLUE}================================${NC}"
    echo ""

    echo -e "${GREEN}1. Git Config${NC}"
    echo "   git config --global user.name \"Your Name\""
    echo "   git config --global user.email \"your@email.com\""
    echo ""

    echo -e "${GREEN}2. System Permissions${NC}"
    echo "   시스템 설정 > 개인정보 보호 및 보안 > 입력 모니터링:"
    echo "   - karabiner_grabber, karabiner_observer"
    echo "   손쉬운 사용: Karabiner, Hammerspoon, Rectangle, Snap"
    echo ""

    echo -e "${GREEN}3. Post-Install (sudo 필요)${NC}"
    echo "   brew install --cask docker-desktop"
    echo "   brew install --cask gureumkim"
    echo ""

    echo -e "${GREEN}4. Mac App Store${NC}"
    echo "   App Store 로그인 후: grep '^mas ' ~/.dotfiles/Brewfile | brew bundle --file=-"
    echo ""

    echo -e "${GREEN}5. CLI Logins${NC}"
    echo "   gh auth login"
    echo ""

    echo -e "${GREEN}6. Shell 재시작${NC}"
    echo "   source ~/.zshrc && mise install"
    echo ""
}

# ===========================================
# Main
# ===========================================
main() {
    echo ""
    echo "================================"
    echo "  dotfiles installer"
    echo "================================"
    echo ""
    echo "This will install and configure your development environment."
    echo ""

    # sudo 권한 캐시 (Homebrew 설치에 필요)
    info "Caching sudo credentials..."
    sudo -v

    # sudo 캐시 유지 (백그라운드)
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    install_homebrew
    install_packages
    install_mas_apps
    install_ohmyzsh
    install_zsh_plugins
    install_tmux
    create_symlinks
    setup_claude
    restore_app_settings
    configure_macos_defaults
    install_mise_tools
    install_nvim_plugins
    install_tmux_plugins
    post_install
    run_verification
    show_secrets_guide

    echo ""
    echo -e "${GREEN}================================${NC}"
    echo -e "${GREEN}  Installation Complete!${NC}"
    echo -e "${GREEN}================================${NC}"
    echo ""
    echo "Restart your terminal or run: source ~/.zshrc"
    echo ""
}

main "$@"
