# Fig pre block. Keep at the top of this file.
# export PATH="${PATH}:${HOME}/.local/bin"
# eval "$(fig init zsh pre)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/youngsukyoo/.oh-my-zsh"
# export M1=1
#export "PATH=/opt/homebrew/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/readline/include"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
#

plugins=(
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
	fzf
	thefuck
	#git vi-mode
	fasd
	# tmux
	#git
)
autoload -U compinit && compinit
set -o vi
source $ZSH/oh-my-zsh.sh
source /Users/youngsukyoo/.config/broot/launcher/bash/br
# . $(brew --prefix asdf)/libexec/asdf.sh
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#plugins=(git vi-mode)
#plugins=(zsh-autosuggestions)
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.


export MANPATH="`manpath`:/opt/homebrew/opt/readline/share/man:/opt/homebrew/opt/tmux/share/man:/opt/homebrew/opt/pass/share/man"



[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias rm="trash"
alias norm="norminette"
alias ctags="`brew --prefix`/bin/ctags"
alias gs="git status"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias vimdiff="nvim -d"
alias vd="nvim -d"
alias ls="lsd"
alias diff="delta"
alias tree="broot"
alias lt="lsd --tree -I node_modules"
alias g="lazygit"

export EDITOR=/opt/homebrew/bin/nvim
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export TERM=screen-256color

# export PATH="/Users/youngsukyoo/.config/coc/extensions/coc-clangd-data/install/12.0.1/clangd_12.0.1/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export FZF_DEFAULT_OPTS="--extended"

eval "$(zoxide init zsh)"

alias ccc="c++ -Wall -Wextra -Werror -std=c++98"
alias tnode="ts-node"

bindkey "ç" fzf-cd-widget

# bindkey "^j" fzf-cd-widget
# export TODOIST_API_KEY="$(pass Todoist/API)"

function killport() { 
  lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9
}
function lleak() {
	while true; do leaks $1; sleep 1; clear; done
}
unset CPPFLAGS
unset LDFLAGS


# alias fiive="cd ~/side_project/fiive_BE_local; export PYTHONUNBUFFERED=1;export FLASK_APP=run.py;export ENV_FILE_LOCATION=.env;export FLASK_ENV=development; source ./.venv/bin/activate"

export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/opt/homebrew/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source <(kubectl completion zsh)
