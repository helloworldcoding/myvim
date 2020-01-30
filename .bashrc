set -o vi

alias c='clear'
alias cd1='cd ..'
alias cd2='cd ..; cd ..;'
alias cd3='cd ..; cd ..; cd ..;'
alias cd4='cd ..; cd ..; cd ..; cd ..;'

# my PS1
export PS1='\n\
[\[\e[36m\]\u\[\e[0m\]\
@\
\[\e[36m\]\h \
\[\033[01;34m\]\w\
\[\e[0m\]] \
$(RETVAL="$?"; echo -en "\e[33m$(date +'%H:%M:%S') ";
if [ "$RETVAL" -eq 0 ];then 
        echo -en "\[\e[32m\]$RETVAL"
else
        echo -en "\[\e[31;1m\a\]$RETVAL"
fi)\n\
\[\e[0;1;34m\]\$ \[\e[0m\]'
# my PS1 end
