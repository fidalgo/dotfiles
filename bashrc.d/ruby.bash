if command -v rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi
export PATH="$HOME/.rbenv/bin:$PATH"
