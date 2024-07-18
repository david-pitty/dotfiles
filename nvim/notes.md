# fighting one eyed kirby  \(*.\)
`:%s/start-pattern\(.*\)end-pattern/\1`
- the fighting one eyed kirby is a capture group that is used as the replace value at the end
- start pattern is require, cannot be just star anything `.*`


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


# Visual mode
When selecting a word, and doing substitution, use `\%V` as anchor tags
for the start and end of selection to avoid getting matches before search pattern.


# Minimal vim
https://www.youtube.com/watch?v=XA2WjJbmmoM



# TODO:
Look into fzf and integration https://www.youtube.com/watch?v=MvLQor1Ck3M
Setup LSP: https://github.com/williamboman/mason-lspconfig.nvim
