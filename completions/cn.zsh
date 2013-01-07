if [[ ! -o interactive ]]; then
    return
fi

compctl -K _cn cn

_cn() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(cn commands)"
  else
    completions="$(cn completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
