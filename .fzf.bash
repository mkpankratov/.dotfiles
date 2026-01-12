# Setup fzf
# ---------
if [[ ! "$PATH" == */home/Mpankratov/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/Mpankratov/.fzf/bin"
fi

eval "$(fzf --bash)"
