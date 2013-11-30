Automatically and asynchrony generates and reads a tags file
according to the type of the file that is being edited using
ctags. It depends on [vimproc](https://github.com/Shougo/vimproc.vim).

# Usage

Just edit and save your files. Evey time a buffer is loaded the
script set the local value of the tags option to
fileextension.tags, and every time you save a file it generates,
recursively, a fileextension.tags.

# Configuration

<dl>
<dt>g:tagsloader_ctags:</dt>
<dd>String declaring the ctags binary. Default: 'ctags'.</dd>
<dt>g:tagsloader_ctags_exclude:</dt>
<dd>String with patterns to be excluded by ctags. Default: '.git'.</dd>
<dt>g:tagsloader_ignore_extensions:</dt>
<dd>List of file extensios you don't want to generate tags.
Default: ['css', 'html', 'markdown', 'sql', 'vim'].</dd>
</dl>
