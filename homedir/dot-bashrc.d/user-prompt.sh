#!/usr/bin/env bash

# Nice colourful prompt for non-root users
CYAN='\[\e[38;5;75m\]'
PURPLE='\[\e[38;5;171m\]'
WHITE='\[\e[37m\]'
BRIGHT_CYAN='\[\e[38;5;45m\]'
RED='\[\e[31m\]'
RESET='\[\e[0m\]'
BOLD='\[\e[1m\]'

function show_exit_code() {
    local exit_code=$?
    if [[ $exit_code -ne 0 ]]; then
        echo " [${exit_code}]"
        return
    fi
    echo
}

function show_current_branch() {
        branch_name=$(git branch --show-current 2>/dev/null)
        if [[ -n $branch_name ]]; then
                echo " {git: $branch_name}"
                return
        fi
        echo 
}

function make_prompt() {
  local exit_code=$(show_exit_code)
  local git_branch=$(show_current_branch)
  PS1="╭─ ${CYAN}[\A]${RESET} ${PURPLE}\u${RESET}@${CYAN}${BOLD}\h${RESET} ${WHITE}\W${RESET}${BRIGHT_CYAN}${git_branch}${RESET}\n╰─➤${RED}${exit_code}${RESET} \$ "
}

PROMPT_COMMAND=make_prompt
