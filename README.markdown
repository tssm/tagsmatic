Automatically and asynchrony generates and reads a tags file
according to the type of the file that is being edited using
ctags. It depends on [vimproc](https://github.com/Shougo/vimproc.vim)
and [Exuberant Ctags](http://ctags.sourceforge.net/).

# Usage

Just edit and save files whose extension is in the
g:tagsloader_use_ctags_for list. Evey time the buffer is saved the
script generates, recursively, a {fileextension}.tags file in the
current directory, and every time a BufNewFile, BufRead or
BufWinEnter events gets fired it sets the value of the tags option
to {fileextension}.tags, if exists.

# Configuration

<dl>
<dt>g:tagsloader_ctags:</dt>
<dd>String declaring the ctags binary. Default: 'ctags'.</dd>
<dt>g:tagsloader_use_ctags_for:</dt>
<dd>List of file extensions you want to generate tags. It must be
supported by your ctags program.</dd>
</dl>
