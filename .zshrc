if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

if [ -f ~/.zplug/log/job.lock ]; then
    echo "Remove lock file!"
    rm -f ~/.zplug/log/job.lock
fi

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2          # Syntax highlighting for commands
zplug "zsh-users/zsh-autosuggestions"
zplug "lib/completion", from:oh-my-zsh                      # Load completion library for those sweet [tab] squares
zplug 'zplug/zplug', hook-build:'zplug --self-manage'       # Manage zplug as other plugins
zplug "plugins/colored-man-pages", from:oh-my-zsh           # Add colors to man pages
zplug "plugins/command-not-found", from:oh-my-zsh           # Suggests package name with relevant command
zplug "plugins/extract", from:oh-my-zsh                     # 'x' alias - swiss knife for archive extracting

zplug load

HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt noincappendhistory
setopt nosharehistory
setopt interactivecomments # bash style comments
setopt autocd
setopt +o nomatch # Allow * commands i.g.: rm -f *

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

bindkey -v

# Load theme
if [ -f $HOME/.zsh/colors/theme.zsh ]; then
    source $HOME/.zsh/colors/theme.zsh
fi

# Load configuration
if [ -f $HOME/.bashrc.global ]; then
    source $HOME/.bashrc.global
fi

# Load FZF
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

if [ -f $HOME/.bashrc.local ]; then
    source $HOME/.bashrc.local
fi
