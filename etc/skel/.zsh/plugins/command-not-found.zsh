#!/usr/bin/env zsh

if [[ -r "/usr/share/doc/pkgfile/command-not-found.zsh" ]]; then
	source "/usr/share/doc/pkgfile/command-not-found.zsh"
else
	command_not_found_handler() {
		local pkgs cmd="$1" files=()
		printf 'zsh: command not found: %s' "$cmd"
		files=(${(f)"$(pacman -F --machinereadable -- "/usr/bin/${cmd}")"})
		if (( ${#files[@]} )); then
			printf '\r\e[1m%s\e[0m may be found in the following packages:\n' "$cmd"
			local res=() repo package version file
			for file in "$files[@]"; do
				res=("${(0)file}")
				repo="$res[1]"
				package="$res[2]"
				version="$res[3]"
				file="$res[4]"
				printf '  %s/%s %s: /%s\n' "$repo" "$package" "$version" "$file"
			done
		else
			printf '\n'
		fi
		return 127
	}
fi
