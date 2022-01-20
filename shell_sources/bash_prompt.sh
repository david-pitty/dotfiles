parse_git_branch() {
     echo " ($(git rev-parse --abbrev-ref HEAD 2> /dev/null))"
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[35m\]\$(parse_git_branch)\[\033[m\]\$ "
