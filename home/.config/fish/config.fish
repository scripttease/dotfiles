# Terminal
set --export EDITOR "/usr/bin/env nvim"
set --export TERM xterm

# Postgres config
set --export PGHOST localhost
set --export PGUSER postgres

# Path
set fish_user_paths \
  "$GOPATH/bin" \
  "$HOME/.homesick/repos/homeshick/bin" \
  "$HOME/.rbenv/bin"

# Aliases

alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'
alias n 'nvim'
alias be 'bundle exec'
alias ber 'bundle exec rake'
alias berc 'bundle exec rails console'
alias beg 'bundle exec guard'
alias serve 'ruby -run -e httpd . -p 4000'
alias get-docker-postgres "docker run -t -d -p 5432:5432 --name postgres postgres"
alias g 'git'
alias ga 'git add --all; and git status'
alias gs 'git status'

# Autojump
if test -e /usr/local/share/autojump/autojump.fish
  source /usr/local/share/autojump/autojump.fish
end

# rbenv ruby version manager
if test -e $HOME/.rbenv/bin/rbenv
  set PATH $HOME/.rbenv/bin $PATH
  set PATH $HOME/.rbenv/shims $PATH
  rbenv rehash >/dev/null ^&1
end

# Hub
if command --search /usr/local/share/autojump/autojump.fish >/dev/null
  eval (hub alias -s)
end

# Prompt

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch green

set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles '?'

function fish_prompt -d "Write out the prompt"
  set laststatus $status

  printf '%s%s %s%s%s%s%s' \
    (set_color green) $USER \
    (set_color yellow) (echo $PWD | sed -e "s|^$HOME|~|") \
    (set_color white) (__fish_git_prompt) \
    (set_color white)
  if test $laststatus -eq 0
    printf " %s\$ %s" (set_color grey) (set_color normal)
  else
    printf " %s✘ %s\$ %s" (set_color -o red) (set_color grey) (set_color normal)
  end
end
set -g fish_user_paths "/usr/local/opt/elasticsearch@2.4/bin" $fish_user_paths
