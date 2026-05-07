# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# (Disabled because we are using Starship)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PAT
export PATH="/opt/homebrew/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  # iTerm2 config
  ZSH_THEME=""
else
  # Default macOS Terminal config
  ZSH_THEME=""
fi

export LS_COLORS="di=1;34:ln=36:so=32:pi=33:ex=1;32:*.py=1;36:*.js=1;33:*.html=1;35:*.css=1;35:*.jpg=1;31:*.png=1;31"

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# User configuration
#============================================================================

. "$HOME/.local/bin/env"

# ==== PATH ====
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Users/ayushparoha/.antigravity/antigravity/bin:$PATH"
export PATH="/Users/ayushparoha/.opencode/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# ==== System ====
alias reload="source ~/.zshrc && echo '✅ zshrc reloaded'"

# ==== Apps ====
alias b="open -a 'Brave Browser'"
alias wa="open -a 'WhatsApp'"
alias code="open -a 'Visual Studio Code'"
alias anti="Antigravity"

# ==== File Listing ====
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"

# ==== Websites ====
alias moodle="open 'https://lms.sitpune.edu.in/login/index.php?loginredirect=1'"
alias yt="open 'https://www.youtube.com/'"
alias mov="open 'https://cinevo.site/'"
alias gpt="open 'https://chatgpt.com/'"
alias gh="open 'https://github.com/trending'"
alias anime="open 'https://hianimes.se/home'"
alias linkedin="open 'https://www.linkedin.com/feed/'"
alias doc="open 'https://docs.google.com/document/create'"

# ==== Navigation ==== 
alias ..="cd .."
alias ...="cd ../.."
alias c="cd /Users/ayushparoha/Documents/Data_Science/cprogram"
alias python="cd /Users/ayushparoha/Documents/Data_Science/env"

# ==== Ytsearch ====
unalias ytsearch 2>/dev/null
ytsearch() {
  if [ $# -eq 0 ]; then
    echo "Usage: ytsearch <query>"
    return 1
  fi
  query="${*// /+}"
  open -a "Brave Browser" "https://www.youtube.com/results?search_query=$query"
}

# ==== Brave search ====
search() {
  if [ $# -eq 0 ]; then
    echo "Usage: searchb <your query>"
    return 1
  fi
  query="${*// /+}"
  open -a "Brave Browser" "https://search.brave.com/search?q=$query"
}

# ==== Project Creator ====
unalias proj 2>/dev/null
proj() {
  if [ -z "$1" ]; then
    echo "Usage: proj <project_name>"
    return 1
  fi
  PROJECT_NAME=$1
  BASE_DIR=~/projects
  PROJECT_DIR=$BASE_DIR/$PROJECT_NAME
  mkdir -p "$BASE_DIR"
  mkdir -p "$PROJECT_DIR"
  cd "$PROJECT_DIR" || return
  echo "📁 Created project: $PROJECT_NAME"
  python3 -m venv venv
  source venv/bin/activate
  echo "🐍 Virtual environment ready"
  git init
  echo "🔧 Git initialized"
  echo -e "venv/\n__pycache__/\n*.pyc" > .gitignore
  echo "print('Hello $PROJECT_NAME')" > main.py
  touch README.md requirements.txt
  code .
  echo "🚀 Project ready!"
}

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ================== STARSHIP ==================
eval "$(starship init zsh)"