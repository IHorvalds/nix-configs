#!/usr/bin/env bash

# Nice colorful prompt for non-root
CYAN='\[\e[38;5;75m\]'
PURPLE='\[\e[38;5;171m\]'
WHITE='\[\e[37m\]'
BRIGHT_CYAN='\[\e[38;5;45m\]'
RED='\[\e[31m\]'

# Colorful prompt for root
BRIGHT_RED='\[\e[38;5;9m\]'
ORANGE='\[\e[38;5;208m\]'
ITALIC_WHITE='\[\e[37;3m\]'
TURQUOISE='\[\e[38;5;45m\]'

RESET='\[\e[0m\]'
BOLD='\[\e[1m\]'

show_exit_code() {
	local exit_code=$?
	if [ $exit_code -ne 0 ]; then
		echo " [${exit_code}]"
		return
	fi
	echo
}

show_current_branch() {
	branch_name=$(git branch --show-current 2>/dev/null)
	if [ -n "$branch_name" ]; then
		echo " {git: $branch_name}"
		return
	else
		echo
	fi
}

show_container() {
	[ -f /.dockerenv ] && echo " 🐋"
}

make_prompt() {
	local exit_code=$(show_exit_code)
	local git_branch=$(show_current_branch)
	local container=$(show_container)
	if [ "$EUID" == 0 ]; then
		PS1="╭─ ${CYAN}[\A]${RESET} ${BRIGHT_RED}\u${RESET}@${ORANGE}${BOLD}\h${RESET}${container} ${ITALIC_WHITE}\W${RESET}${BRIGHT_CYAN}${git_branch}${RESET}\n╰─➤${RED}${exit_code}${RESET} \$ "
	else
		PS1="╭─ ${CYAN}[\A]${RESET} ${PURPLE}\u${RESET}@${CYAN}${BOLD}\h${RESET}${container} ${WHITE}\W${RESET}${BRIGHT_CYAN}${git_branch}${RESET}\n╰─➤${RED}${exit_code}${RESET} \$ "
	fi
}

PROMPT_COMMAND=make_prompt
