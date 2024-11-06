source ./omakub.sh

FONT_PATTERN="Cascadia\|iAWriterMono"

if fc-list | grep -i "$FONT_PATTERN" >/dev/null; then
  echo "One or both fonts are already installed."
else
  echo "Neither Cascadia Mono nor iA Writer Mono is installed."
  source "$LOCAL_PATH/install/desktop/fonts.sh"
fi
