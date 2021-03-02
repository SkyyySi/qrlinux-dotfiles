#!/usr/bin/env zsh

if [[ "$REPLACE_LS_WITH_EXA" = "true" ]]; then
  # Replace ls with exa.
  alias ls='exa  --git'
  alias la='exa  --git -a'
  alias ll='exa  --git -lahmg --group-directories-first'
  alias llr='exa --git -alR   --group-directories-first'
  alias l='exa   --git -l     --group-directories-first'
else
  # Some useful aliases for ls.
  alias ls='ls  -F      --color=auto'
  alias la='ls  -AF     --color=auto'
  alias ll='ls  -lAhsF  --color=auto --group-directories-first'
  alias llr='ls -lRAhsF --color=auto --group-directories-first'
  alias l='ls   -lhsF   --color=auto --group-directories-first'
fi

# Color for some coreutils commands.
# Note that this may not work with busybox.
alias grep='grep   --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias vdir='vdir   --color=auto'
alias watch='watch --color'
alias ip='ip -c'
