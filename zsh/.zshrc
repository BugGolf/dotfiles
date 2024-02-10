ZSH_THEME=agnoster
plugins=(
  git 
  vscode 
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

source ${ZSH}/oh-my-zsh.sh
source ${NVM_DIR}/nvm.sh

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG='' 

  # Adds the new line and ➜ as the start character.
  printf "\n ➜";
}

alias ngc="ng generate @schematics/angular:component"
