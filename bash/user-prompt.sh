#!/bin/bash

# Nice colourful prompt for non-root users

function show_current_branch() {
        branch_name=$(git branch --show-current 2>/dev/null)
        if [[ ! -z $branch_name ]]; then
                echo " {git: $branch_name}"
                return
        fi
        echo 
}
# Set PS1 if not already set
PS1='\[\e[38;5;220m\]\u\[\e[37m\]@\[\e[38;5;208m\]\h\[\e[0m\] \[\e[37;3m\]\W\[\e[0m\]\[\e[38;5;45m\]$(show_current_branch)\[\e[0m\]\n\$ '
