if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export PATH=/usr/local/mysql/bin:$PATH
export CLICOLOR=1
stty -ixon
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export ANDROID_HOME='/Users/alex.long/pu/sdk'
alias ls='ls -GFh'
alias ctags='/usr/local/bin/ctags'
alias grep='grep --color'
alias g='grep -ri'
alias gw='grep -wri'
alias f='find'
alias cdalot='. /scripts/cdalot'
alias mv='mv -i'
alias cp='cp -i'
alias rm="echo Sorry, rming is not allowed. Use 'del' to move the file to the trash dir, or to really delete the file, use the full path i.e. '/bin/rm'"
alias del="trash-put"
alias ssh_tapio="ssh invincea@172.20.11.191 -t tmux a"
alias ssh_tapio_no_tmux="ssh invincea@172.20.11.191"

function gh { 
    totalfs=`du -sh | awk '{print $1 }'`
    echo "Grepping through $totalfs worth of files."
    g "$1" .
}
export -f gh

function fh { f . -iname "*$1*"; }
export -f fh

case ${TERM} in

    screen*)

        # user command to change default pane title on demand
        function title { TMUX_PANE_TITLE="$*"; }

        # function that performs the title update (invoked as PROMPT_COMMAND)
        function update_title { printf "\033]2;%s\033\\" "${1:-$TMUX_PANE_TITLE}"; }

        # default pane title is the name of the current process (i.e. 'bash')
        TMUX_PANE_TITLE=$(ps -o comm $$ | tail -1)

        # Reset title to the default before displaying the command prompt
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'update_title'   

        # Update title before executing a command: set it to the command
        trap 'update_title "$BASH_COMMAND"' DEBUG

        ;;

esac
