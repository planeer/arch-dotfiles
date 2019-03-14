if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
  PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi
