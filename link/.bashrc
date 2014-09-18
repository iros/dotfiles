eval "$(rbenv init -)"


export DOCKER_HOST=tcp://localhost:4243

# Add user executables
export PATH=$PATH:~/bin

# Add binaries into the path
export PATH=~/.dotfiles/bin:$PATH

# Mapping stuff
export PATH=/usr/local/git/bin:/Library/Frameworks/GDAL.framework/Versions/1.10/Programs/:$PATH

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/.dotfiles/source/$1.sh"
  else
    for file in ~/.dotfiles/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

# Python aliases
alias pys="python -m SimpleHTTPServer"
alias pyn="ipython notebook --pylab inline"

src