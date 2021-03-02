#!/bin/bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa --color=auto'
alias ..='cd ..'

# The prompt theme. The gitstatus was generated with https://ezprompt.net/

function prompt_command() {
	# Get the status of the current git repo.
	function parse_git_dirty {
		local _git_status=`LANG=C git status 2>&1 | tee`
		local _git_dirty=`echo     -n "${_git_status}" 2> /dev/null | grep "modified:"               &> /dev/null; echo "$?"`
		local _git_untracked=`echo -n "${_git_status}" 2> /dev/null | grep "Untracked files"         &> /dev/null; echo "$?"`
		local _git_ahead=`echo     -n "${_git_status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
		local _git_newfile=`echo   -n "${_git_status}" 2> /dev/null | grep "new file:"               &> /dev/null; echo "$?"`
		local _git_renamed=`echo   -n "${_git_status}" 2> /dev/null | grep "renamed:"                &> /dev/null; echo "$?"`
		local _git_deleted=`echo   -n "${_git_status}" 2> /dev/null | grep "deleted:"                &> /dev/null; echo "$?"`
		local _git_bits=''
		[[ ! "${renamed}"   == "0" ]] || bits=">${_git_bits}"
		[[ ! "${ahead}"     == "0" ]] || bits="*${_git_bits}"
		[[ ! "${newfile}"   == "0" ]] || bits="+${_git_bits}"
		[[ ! "${untracked}" == "0" ]] || bits="?${_git_bits}"
		[[ ! "${deleted}"   == "0" ]] || bits="x${_git_bits}"
		[[ ! "${dirty}"     == "0" ]] || bits="!${_git_bits}"
		if [[ -n "${_git_bits}" ]]; then
			echo "${_git_bits}"
		else
			echo ""
		fi
	}

	# Get the current git branch.
	function parse_git_branch() {
		BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
		if [ ! "${BRANCH}" == "" ]
		then
			STAT=$(parse_git_dirty)
			echo " [${BRANCH}${STAT}]"
		else
			echo ""
		fi
	}

	# Define the seperator. By default, it will be the powerline arrow.
	PROMPT_SEPERAOTR=$'\ue0b0'

	# Define colors as variables.
	FOREGROUND_COLOR="\[\e[30m\]"
	FOREGROUND_RESET="\[\e[39m\]"
	BACKGROUND_RESET="\[\e[49m\]"
	BACKGROUND_USER_HOST="\[\e[47m\]"
	BACKGROUND_USER_HOST_SEPERATOR="\[\e[37m\]"
	if [[ "$EUID" == "0" ]]; then
		BACKGROUND_PATH="\[\e[45m\]"
		BACKGROUND_PATH_SEPERATOR="\[\e[35m\]"
	else
		BACKGROUND_PATH="\[\e[44m\]"
		BACKGROUND_PATH_SEPERATOR="\[\e[34m\]"
	fi

	# Show the exit code.
	function nonzero_exit_code() {
		RETVAL=$?
		[ $RETVAL -ne 0 ] && echo "[${RETVAL}]"
	}

	__prompt_git_status=$(parse_git_branch)
	__prompt_exit_code=`nonzero_exit_code`

	export PS1="${BACKGROUND_USER_HOST} ${FOREGROUND_COLOR}\u@\h ${FOREGROUND_RESET}${BACKGROUND_PATH}${BACKGROUND_USER_HOST_SEPERATOR}${PROMPT_SEPERAOTR} ${FOREGROUND_COLOR}\w${__prompt_git_status}${__prompt_exit_code} \\$ ${BACKGROUND_RESET}${BACKGROUND_PATH_SEPERATOR}\${PROMPT_SEPERAOTR}${FOREGROUND_RESET} "
}

PROMPT_COMMAND=prompt_command

# Load ~/.bashrc.local for user overrides.
[[ ! -r "${HOME}/.bashrc.local" ]] || . "${HOME}/.bashrc.local"
