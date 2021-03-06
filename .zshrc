#------------------------
# zsh General Settings
#------------------------

# Env setting

export LANG=ja_JP.UTF-8
export GOPATH=$HOME/go

# RubyMine PATH
export PATH="$HOME/jobs/tools/RubyMine-171.4424.33/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# [ -s /home/tksugar/.rvm/scripts/rvm ] && source /home/tksugar/.rvm/scripts/rvm
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

typeset -U path PATH

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

if [ $SHLVL = 1 ]; then
  tmux
fi

# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Use modern completion system
source /usr/local/bin/aws_zsh_completer.sh
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Option
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob

# Alias
alias vi='vim'
alias ls='ls -CF'
alias ll='ls -lha --color=auto'
alias la='ls -CFa'
alias rf='rm -rf'
alias mk='touch'
alias mv='mv -i'
alias grep='grep --color'
alias df='df -h'
alias ps='ps --sort=start_time'
alias vis="vim -S ~/.vim.session"
alias be="bundle exec"
alias pbcopy='xsel --clipboard --input'
alias tc='tmux save-buffer - | pbcopy'
alias sakura="~/.wine/drive_c/Program\ Files\ \(x86\)/sakura/sakura.sh"
alias nkflinux='nkf --overwrite -w -Lu'

# Global Alias
alias -g L='| less'
alias -g G='| grep'
alias -g C='| xsel --clipboard --input'
