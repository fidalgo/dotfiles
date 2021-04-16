shopt -s histappend
# Record each line as it gets issued
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=inoreboth:erasedups
HISTIGNORE="&:ls:l:la:ll:exit"
bind '"\e[A"':history-search-backward # up arrow
bind '"\e[B"':history-search-forward  # down arrow
