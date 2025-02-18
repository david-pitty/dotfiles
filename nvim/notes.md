# Search and replace

## Fighting one eyed kirby  \(*.\)
`:%s/start-pattern\(.*\)end-pattern/\1`
- the fighting one eyed kirby is a capture group that is used as the replace value at the end
- start pattern is require, cannot be just star anything `.*`

## To Upper/Lowercase
`:%s/pattern/\U\0`
- change pattern to upper case
- \L for lowercase

## Case sensitive search
\C = case sensitive
\c = case insensitive (default due to ignore case)
`:vimgrep /test\C/ %`
- works in Vimgrep, slash search and substitude (`:%s`)


# G commands
## Sequence of numbers
- set a bunch of 0s in a column
- block select them
- press g, then Ctrl+A
- creates a sequence of numbers


# Ctags
- install universal `scoop install extras/universal-ctags`
- from root of project run command `ctags -R source/.../*`
- `Ctrl+W+]` opens tag definition in a new window
- `Ctrl+X Ctrl+]` completes from tags file
- ref: https://www.youtube.com/watch?v=iNNcCo5djio


# Repeat previous command
Tip: to repeat command do `@:` (can hold Raise layer)


# Folds
zM fold all [Minimize]
zR unfold all [Restore]
zA toggle fold recursively
za toggle fold
zi enable/disable folds (toggle)


# Visual mode
When selecting a word, and doing substitution, use `\%V` as anchor tags
for the start and end of selection to avoid getting matches before search pattern.


# Minimal vim
https://www.youtube.com/watch?v=XA2WjJbmmoM

# Movement
## Move to next blank line
Use parenthesis to next text block (divided by blank line)

# Paste
Paste from register in normal mode: `"<register>p`
Paste from register in insert mode: `Ctrl-R + <register>`


# TODO:
Look into fzf and integration https://www.youtube.com/watch?v=MvLQor1Ck3M
