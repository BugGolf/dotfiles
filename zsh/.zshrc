ZSH_THEME=agnoster
plugins=(
  git 
  vscode 
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

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

source ~/.nvm/nvm.sh
source ~/.oh-my-zsh/oh-my-zsh.sh

alias ngc="ng generate @schematics/angular:component"
