# Setup homebrew auto-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Wire up virtualenvwrapper completion and paths.
source /usr/local/bin/virtualenvwrapper.sh

# Setup the history to remove dupes, lines that start with a space.
# Also, make the history HUGE.
export HISTCONTROL=ignoreboth
export HISTSIZE=50000
export HISTIGNORE="[ ]*"

# My vimrc is causing problems with the commit editing, so use nano. ugh.
export SVN_EDITOR=nano
export GIT_EDITOR=nano

# Handy alias to search the history. usage; hack <term>
alias hack='history | ack -i '

# I always forget the vim.
alias vi='vim'

# Nice ls tweaks.
alias ls='ls -F'
alias ll='ls -lh'

# extract archives -- usage: extract </path/to/archive/>
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Prevent pip from doing anything unless you're inside an activated virtualenv.
PIP=/usr/local/bin/pip
function pip {
    if [ "x$VIRTUAL_ENV" = 'x' ]; then
        echo "No virtualenv activated; bailing."
    else
        $PIP -E `basename $VIRTUAL_ENV` "$@"
    fi
}

