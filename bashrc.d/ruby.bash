autoload_rbenv() {
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    unset -f rbenv autoload_rbenv
}

rbenv() {
    autoload_rbenv
    rbenv "$@"
}
