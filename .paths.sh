#------------------------------
#       Python stuff
#------------------------------

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init -)"
fi

export PATH="$HOME/.poetry/bin:$PATH"


#------------------------------
#        Go stuff
#------------------------------

export GOPATH=$HOME/Code/Go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH


#------------------------------
#       Rust stuff
#------------------------------

export CARGO_HOME=$HOME/.cargo
export PATH="$CARGO_HOME/bin:$PATH"


#------------------------------
#          Other
#------------------------------

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
