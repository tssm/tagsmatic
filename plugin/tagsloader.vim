if exists('g:tagsloader_loaded')
	finish
endif

let g:tagsloader_loaded = 1

if !exists('g:tagsloader_ctags')
	let g:tagsloader_ctags = 'ctags'
endif

if !exists('g:tagsloader_ignore_extensions')
	let g:tagsloader_ignore_extensions = ['css', 'html', 'markdown', 'sql', 'vim']
endif

function s:GenerateTags()
	let l:file_extension = expand("%:e")
	let l:index = index(g:tagsloader_ignore_extensions, tolower(l:file_extension))
	if l:index >= 0
		return 0
	endif
	execute 'call vimproc#system_bg("' . g:tagsloader_ctags . ' -f ' . l:file_extension . '.tags --languages=' . &filetype . ' .")'
endfunction

function s:SetTags()
	let l:file = expand("%:e") . ".tags"
	if filereadable(l:file)
		execute "setlocal tags=" . l:file
	endif
endfunction

augroup GenerateTags
	autocmd!
	autocmd BufWritePost * call s:GenerateTags()
augroup END

augroup SetTags
	autocmd!
	autocmd BufNewFile,BufRead,BufWinEnter * call s:SetTags()
augroup END
