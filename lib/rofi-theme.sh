# Import Theme
ROFI_FONT="JetBrains Mono Nerd Font 10"
ROFI_TYPE="$HOME/.config/rofi/applets/type-5"
ROFI_STYLE='stylebrlk.rasi'
ROFI_THEME="$ROFI_TYPE/$ROFI_STYLE"

ROFI_MENU_COL='1'
ROFI_MENU_ROW='8'

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "listview {columns: $ROFI_MENU_COL; lines: $ROFI_MENU_ROW;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -theme-str "element-text {font: \"$ROFI_FONT\";}" \
    -dmenu \
    -i \
    -markup-rows \
    -theme ${ROFI_THEME}
}
