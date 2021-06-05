# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias n='nvim'
alias a='alacritty'

alias be='bundle exec'
alias ber='bundle exec rake'
alias berc='bundle exec rails console'
alias beg='bundle exec guard'

# Git aliases
alias g='git'
alias ga='git add'
alias gas='git add --all && git status'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gci='git commit'

# Docker aliases
alias get-docker-postgres="docker run -t -d -p 5432:5432 --name postgres postgres"

# pop up server
alias serve='echo "ruby -run -e httpd . -p 4000" && ruby -run -e httpd . -p 4000'

# Start autojump on Debian
if [ -f "/usr/share/autojump/autojump.sh" ]; then
  source /usr/share/autojump/autojump.sh
fi

# asdf version manager
if [ -d "$HOME/.asdf" ]; then
  source "$HOME/.asdf/asdf.sh"
fi

export EDITOR=nvim

# Postgres client config

export PGHOST=localhost
export PGUSER=postgres

##########
#  PATH  #
##########

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin/node-dir/bin:$PATH"
export PATH="$HOME/.homesick/repos/homeshick/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cache/rebar3/bin:$PATH"

# Rust support
export PATH="$HOME/.cargo/bin:$PATH"
