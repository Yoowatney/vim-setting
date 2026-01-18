# dotfiles

macOS development environment dotfiles.

## Includes

- **Neovim** - LazyVim based config
- **Tmux** - gpakosz/.tmux based config
- **Zsh** - Oh-My-Zsh + Powerlevel10k
- **Lazygit** - Custom keybindings
- **iTerm2** - Settings backup
- **Brewfile** - Homebrew packages

## Installation

```bash
git clone https://github.com/USERNAME/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./init.sh
```

## What init.sh does

1. Install Homebrew (if not installed)
2. Install packages from Brewfile
3. Install Oh-My-Zsh + plugins (p10k, autosuggestions, syntax-highlighting)
4. Install gpakosz/.tmux + TPM
5. Create symlinks (existing files backed up to `.bak`)
6. Set zsh as default shell

## Symlinks

| Source | Target |
|--------|--------|
| `nvim/` | `~/.config/nvim` |
| `zsh/zshrc` | `~/.zshrc` |
| `zsh/p10k.zsh` | `~/.p10k.zsh` |
| `tmux/tmux.conf.local` | `~/.tmux.conf.local` |
| `lazygit/` | `~/.config/lazygit` |

## Post Install

- Restart terminal or `source ~/.zshrc`
- In tmux, press `prefix + I` to install plugins
