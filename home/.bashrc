# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Displays git repo status info
source ~/.git_prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1

build_ps1() {
  # Green default prompt
  local color='\[\e[1;32m\]'
  local host=''

  # If ssh, yellow prompt, include host name
  [[ $SSH_TTY ]] && color='\[\e[1;33m\]'
  [[ $SSH_TTY ]] && host="@$HOSTNAME"

  # If root, red prompt
  [[ $UID -eq 0 ]] && color='\[\e[1;31m\]'

  # Build
  local part1="${color}\u${host} "
  local part2="\[\e[1;34m\]\w${color}"
  local part3='$(__git_ps1 " [%s]") \[\e[m\]\$'
  echo $part1$part2$part3' '
}
PS1=$(build_ps1)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias n='nvim'

alias be='bundle exec'
alias ber='bundle exec rake'
alias berc='bundle exec rails console'
alias beg='bundle exec guard'

# Docker aliases
alias get-docker-postgres="docker run -t -d -p 5432:5432 --name postgres postgres"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# pop up server
alias serve='echo "ruby -run -e httpd . -p 4000" && ruby -run -e httpd . -p 4000'
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Start autojump on Debian
if [ -f "/usr/share/autojump/autojump.sh" ]; then
  source /usr/share/autojump/autojump.sh
fi

# Ruby rbenv version manager
if [ -d "$HOME/.rbenv" ]; then
  eval "$("$HOME"/.rbenv/bin/rbenv init -)"
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
