function get_git_branch() {
if [[ ! -z $(git branch --show-current 2> /dev/null) ]]; then
    echo "{ git: $(git branch --show-current 2> /dev/null) }"
fi
echo ""
}

PROMPT_COMMAND='PS1_CMD1=$(get_git_branch)'

PS1='\[\e[38;5;220m\]\u\[\e[37m\]@\[\e[38;5;208m\]\h\[\e[0m\] \[\e[37;3m\]\W\[\e[0m\]\[\e[38;5;45m\] ${PS1_CMD1}\[\e[0m\]\n$ '
