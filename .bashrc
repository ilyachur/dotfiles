function loadEnv() {
    [ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
    [ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

if [ -z "$PS1"  ]; then
       return
fi
if type "zsh" > /dev/null; then
    exec zsh
else
    loadEnv
fi
