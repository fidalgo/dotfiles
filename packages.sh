RTX_PATH="$BIN_DIR/rtx"

install_rtx(){
  if [ "$OPT" = "--reset" ] || ! [ -f "$RTX_PATH" ]; then
    echo "Installing rtx"
    curl https://rtx.pub/rtx-latest-linux-x64 > "$RTX_PATH"
    chmod +x "$RTX_PATH"
  fi
}

install_packages(){
  [ -d "$BIN_DIR" ] || mkdir $BIN_DIR

  install_rtx
}

uninstall_packages(){
  rm -rv "$RTX_PATH"
}
