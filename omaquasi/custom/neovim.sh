SOURCE_DIR="./custom/neovim"
DESTINATION="$HOME/.config/nvim/lua/"

echo "Installing plugins..."
cp -r "$SOURCE_DIR"/plugins/* "$DESTINATION/plugins"
echo "Plugins installed successfully."

echo "Installing configs..."
cp -r "$SOURCE_DIR"/config/* "$DESTINATION/config"
echo "Configs installed successfully."
