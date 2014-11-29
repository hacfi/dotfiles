export MARKPATH=$HOME/.marks

jump() {
  mark=$(head -n 1 "$MARKPATH/$1" 2>/dev/null)

  if [[ $mark != '' ]]; then
    cd $mark
  else
    echo "No such mark: $1"
  fi
}

mark() {
  if (( $# == 0 )); then
    MARK=$(basename "$(pwd)")
  else
    MARK="$1"
  fi

  if read -q \?"Mark $(pwd) as ${MARK}? (y/n) "; then
    mkdir -p "$MARKPATH"; echo "$(pwd)" > "$MARKPATH/$MARK"
  fi
}

unmark() {
  rm -i "$MARKPATH/$1"
}

autoload colors
marks() {
  find "$MARKPATH" -type f | while read filename
  do
   printf "$fg_no_bold[blue]%-12s$reset_color -> $fg_no_bold[green]%s$reset_color\n" $(basename ${filename}) $(head -n 1 ${filename})
  done
}

_completemarks() {
  reply=($(ls "${MARKPATH}"))
}
compctl -K _completemarks jump
compctl -K _completemarks unmark

_mark_expansion() {
  setopt extendedglob
  autoload -U modify-current-argument
  modify-current-argument '$(head -n 1 "$MARKPATH/$ARG")'
}
zle -N _mark_expansion
bindkey "^j" _mark_expansion
