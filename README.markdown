This script generates and reads automatically and asynchronously
(so it requires [Neovim][neovim]) a tags file according to the
type of the file that is being edited.

# Usage

You only need to edit and save files supported by [Universal
Ctags][ctags]. Every time the buffer is saved the script generates
a `.tags/{&filetype}` file in the working directory according to
your settings in `~/.ctags`, and every time a `BufNewFile`,
`BufRead` or `BufWinEnter` events gets triggered the script
appends if necessary the same file to the local `tags` option.

[ctags]: https://ctags.io
[neovim]: https://neovim.io
