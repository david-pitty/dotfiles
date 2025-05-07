parse_git_branch() {
    git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ $? -eq 0 ]
    then
        echo " ($git_branch)"
    fi
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[35m\]\$(parse_git_branch)\[\033[m\]\$ "
