#!/usr/bin/env zsh
# This is a simple plugin and theme manager for ZSH.

# Enable a few things needed by many themes.
setopt prompt_subst
autoload -Uz colors && colors

# Warn the user if $ZSH is not set.
if [[ -z $ZSH ]]; then
	echo "$0"':'
	echo '$ZSH does not apper to be set, thus no plugins/themes were loaded!'
else
# Load plugin librarys.
if [[ -d $ZSH/lib/ ]]; then
  if [[ $(/usr/bin/ls $ZSH/lib/) != "" ]]; then
    for l in $ZSH/lib/*.zsh; do
      if [[ -r $l ]]; then
        source $l
      fi
    done && unset l
  fi
fi

# Load all plugins.
for p in $ZSH_PLUGINS; do
    if [[ -r $ZSH/plugins/$p/$p.plugin.zsh ]]; then
      source $ZSH/plugins/$p/$p.plugin.zsh
  elif [[ -r $ZSH/plugins/$p/$p.zsh ]]; then
      source $ZSH/plugins/$p/$p.zsh
  elif [[ -r $ZSH/plugins/$p.plugin.zsh ]]; then
      source $ZSH/plugins/$p.plugin.zsh
  elif [[ -r $ZSH/plugins/$p.zsh ]]; then
      source $ZSH/plugins/$p.zsh
  elif [[ -r /usr/share/zsh/plugins/$p/$p.plugin.zsh ]]; then
      source /usr/share/zsh/plugins/$p/$p.plugin.zsh
  elif [[ -r /usr/share/zsh/plugins/$p/$p.zsh ]]; then
      source /usr/share/zsh/plugins/$p/$p.zsh
  elif [[ -r /usr/share/zsh/plugins/$p.plugin.zsh ]]; then
      source /usr/share/zsh/plugins/$p.plugin.zsh
  elif [[ -r /usr/share/zsh/plugins/$p.zsh ]]; then
      source /usr/share/zsh/plugins/$p.zsh
  fi
done && unset p

# Load the specified theme.
  if [[ -z $ZSH_THEME ]]; then
    return
elif [[ $ZSH_THEME = "none" ]]; then
    return
elif [[ -r $ZSH/themes/$ZSH_THEME/$ZSH_THEME.zsh-theme ]]; then
    source $ZSH/themes/$ZSH_THEME/$ZSH_THEME.zsh-theme
elif [[ -r $ZSH/themes/$ZSH_THEME/$ZSH_THEME.zsh ]]; then
    source $ZSH/themes/$ZSH_THEME/$ZSH_THEME.zsh
elif [[ -r $ZSH/themes/$ZSH_THEME.zsh-theme ]]; then
    source $ZSH/themes/$ZSH_THEME.zsh-theme
elif [[ -r $ZSH/themes/$ZSH_THEME.zsh ]]; then
    source $ZSH/themes/$ZSH_THEME.zsh
elif [[ -r /usr/share/zsh/themes/$ZSH_THEME/$ZSH_THEME.zsh-theme ]]; then
    source /usr/share/zsh/themes/$ZSH_THEME/$ZSH_THEME.zsh-theme
elif [[ -r /usr/share/zsh/themes/$ZSH_THEME/$ZSH_THEME.zsh ]]; then
    source /usr/share/zsh/themes/$ZSH_THEME/$ZSH_THEME.zsh
elif [[ -r /usr/share/zsh/themes/$ZSH_THEME.zsh-theme ]]; then
    source /usr/share/zsh/themes/$ZSH_THEME.zsh-theme
elif [[ -r /usr/share/zsh/themes/$ZSH_THEME.zsh ]]; then
    source /usr/share/zsh/themes/$ZSH_THEME.zsh
elif [[ -r /usr/share/zsh-theme-powerlevel10k/$ZSH_THEME.zsh-theme ]]; then
    source /usr/share/zsh-theme-powerlevel10k/$ZSH_THEME.zsh-theme
fi

# Load the user settings.
if [[ -d $ZSH/profile/ ]]; then
  if [[ $(/usr/bin/ls $ZSH/profile/) != "" ]]; then
    for profile in $ZSH/profile/*.zsh; do
      if [[ -r $profile ]]; then
        source $profile
      fi
    done && unset profile
  fi
fi
fi
