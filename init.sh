#!/bin/bash

# ===========================================
# dotfiles init script
# ===========================================

set -e

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ===========================================
# 1. Homebrew
# ===========================================
install_homebrew() {
    info "Checking Homebrew..."
    if ! command -v brew &> /dev/null; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
    info "Installing Homebrew packages..."
    if [[ -f "$DOTFILES/Brewfile" ]]; then
        brew bundle --file="$DOTFILES/Brewfile"
    else
        warn "Brewfile not found, skipping..."
    fi
}

# ===========================================
# 2. Oh-My-Zsh
# ===========================================
install_ohmyzsh() {
    info "Checking Oh-My-Zsh..."
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        info "Installing Oh-My-Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        info "Oh-My-Zsh already installed"
    fi
}

install_zsh_plugins() {
    info "Installing Zsh plugins..."
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
}

# ===========================================
# 3. Tmux (gpakosz/.tmux)
# ===========================================
install_tmux() {
    info "Checking gpakosz/.tmux..."
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
    info "Creating symlinks..."

    mkdir -p "$CONFIG"

    # Neovim
    if [[ -L "$CONFIG/nvim" ]]; then
        warn "nvim symlink exists, skipping..."
    elif [[ -d "$CONFIG/nvim" ]]; then
        warn "nvim directory exists, backing up to nvim.bak..."
        mv "$CONFIG/nvim" "$CONFIG/nvim.bak"
        ln -s "$DOTFILES/editors/nvim" "$CONFIG/nvim"
        info "nvim symlink created"
    else
        ln -s "$DOTFILES/editors/nvim" "$CONFIG/nvim"
        info "nvim symlink created"
    fi

    # Zsh
    if [[ -L "$HOME/.zshrc" ]]; then
        warn ".zshrc symlink exists, skipping..."
    elif [[ -f "$HOME/.zshrc" ]]; then
        warn ".zshrc exists, backing up to .zshrc.bak..."
        mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
        ln -s "$DOTFILES/shell/zsh/zshrc" "$HOME/.zshrc"
        info ".zshrc symlink created"
    else
        ln -s "$DOTFILES/shell/zsh/zshrc" "$HOME/.zshrc"
        info ".zshrc symlink created"
    fi

    # p10k
    if [[ -L "$HOME/.p10k.zsh" ]]; then
        warn ".p10k.zsh symlink exists, skipping..."
    elif [[ -f "$HOME/.p10k.zsh" ]]; then
        warn ".p10k.zsh exists, backing up..."
        mv "$HOME/.p10k.zsh" "$HOME/.p10k.zsh.bak"
        ln -s "$DOTFILES/shell/zsh/p10k.zsh" "$HOME/.p10k.zsh"
        info ".p10k.zsh symlink created"
    else
        ln -s "$DOTFILES/shell/zsh/p10k.zsh" "$HOME/.p10k.zsh"
        info ".p10k.zsh symlink created"
    fi

    # Tmux local config
    if [[ -L "$HOME/.tmux.conf.local" ]]; then
        warn ".tmux.conf.local symlink exists, skipping..."
    elif [[ -f "$HOME/.tmux.conf.local" ]]; then
        warn ".tmux.conf.local exists, backing up..."
        mv "$HOME/.tmux.conf.local" "$HOME/.tmux.conf.local.bak"
        ln -s "$DOTFILES/terminal/tmux/tmux.conf.local" "$HOME/.tmux.conf.local"
        info ".tmux.conf.local symlink created"
    else
        ln -s "$DOTFILES/terminal/tmux/tmux.conf.local" "$HOME/.tmux.conf.local"
        info ".tmux.conf.local symlink created"
    fi

    # Lazygit
    if [[ -L "$CONFIG/lazygit" ]]; then
        warn "lazygit symlink exists, skipping..."
    elif [[ -d "$CONFIG/lazygit" ]]; then
        warn "lazygit directory exists, backing up..."
        mv "$CONFIG/lazygit" "$CONFIG/lazygit.bak"
        ln -s "$DOTFILES/git/lazygit" "$CONFIG/lazygit"
        info "lazygit symlink created"
    else
        ln -s "$DOTFILES/git/lazygit" "$CONFIG/lazygit"
        info "lazygit symlink created"
    fi

    # Mise
    mkdir -p "$CONFIG/mise"
    if [[ -L "$CONFIG/mise/config.toml" ]]; then
        warn "mise config symlink exists, skipping..."
    elif [[ -f "$CONFIG/mise/config.toml" ]]; then
        warn "mise config exists, backing up..."
        mv "$CONFIG/mise/config.toml" "$CONFIG/mise/config.toml.bak"
        ln -s "$DOTFILES/tools/mise/config.toml" "$CONFIG/mise/config.toml"
        info "mise config symlink created"
    else
        ln -s "$DOTFILES/tools/mise/config.toml" "$CONFIG/mise/config.toml"
        info "mise config symlink created"
    fi

    # Karabiner
    if [[ -L "$CONFIG/karabiner" ]]; then
        warn "karabiner symlink exists, skipping..."
    elif [[ -d "$CONFIG/karabiner" ]]; then
        warn "karabiner directory exists, backing up..."
        mv "$CONFIG/karabiner" "$CONFIG/karabiner.bak"
        ln -s "$DOTFILES/macos/karabiner" "$CONFIG/karabiner"
        info "karabiner symlink created"
    else
        ln -s "$DOTFILES/macos/karabiner" "$CONFIG/karabiner"
        info "karabiner symlink created"
    fi
}

# ===========================================
# 5. Manual Installs (curl)
# ===========================================
install_manual() {
    info "Installing manual packages..."

    # uv (Python package manager)
    if ! command -v uv &> /dev/null; then
        info "Installing uv..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
    else
        info "uv already installed"
    fi
}

# ===========================================
# 6. Post Install
# ===========================================
post_install() {
    info "Post installation..."

    # Change default shell to zsh
    if [[ "$SHELL" != *"zsh"* ]]; then
        info "Changing default shell to zsh..."
        chsh -s $(which zsh)
    fi

    # Install fzf key bindings
    if [[ -f "/opt/homebrew/opt/fzf/install" ]]; then
        /opt/homebrew/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
    fi

    info "Done! Restart your terminal or run: source ~/.zshrc"
    info "For tmux plugins, start tmux and press: prefix + I"
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

    install_homebrew
    install_packages
    install_ohmyzsh
    install_zsh_plugins
    install_tmux
    create_symlinks
    install_manual
    post_install

    echo ""
    echo -e "${GREEN}Installation complete!${NC}"
    echo ""
}

main "$@"
