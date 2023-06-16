#if [ -z "$RTX_ENABLED" ]; then
#  TIMEFORMAT='rtx took %R seconds.'
#  time {
  export RTX_ENABLED=1
  eval "$(rtx activate bash)"
#}
#fi

# Node related configs
## Global installed programs, like prettier
export PATH=~/.npm-global/bin:$PATH
