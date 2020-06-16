#!/bin/sh

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'

url=$(grep -Po "$regex" | rofi -dmenu "URL:" -w "$WINDOWID") || exit

opt=$(printf "copy\nopen\ncancel" | rofi -dmenu)

case $opt in
  copy)
    echo "$url" | xclip -selection clipboard
    ;;
  open)
    setsid google-chrome-stable "$url"
    ;;
esac
