autoload_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    unset -f nvm node npm autoload_nvm
}

nvm() {
    autoload_nvm
    nvm "$@"
}

node() {
    autoload_nvm
    node "$@"
}

npm() {
    autoload_nvm
    npm "$@"
}
# Node related configs
## Global installed programs, like prettier
export PATH=~/.npm-global/bin:$PATH
