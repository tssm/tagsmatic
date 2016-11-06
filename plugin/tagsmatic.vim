if exists('g:tagsmatic_loaded')
	finish
endif

let g:tagsmatic_loaded = 1

if !exists('g:tagsmatic_ctags')
	let g:tagsmatic_ctags = 'ctags'
endif

function s:GenerateTags()
	let l:file_extension = expand("%:e")
	if index(g:tagsmatic_use_ctags_for, tolower(l:file_extension)) == -1
		return 0
	endif
	execute 'call vimproc#system_bg("' . g:tagsmatic_ctags . ' -f ' . l:file_extension . '.tags --languages=' . &filetype . ' .")'
endfunction

function s:SetTags()
	let l:tags_file = expand("%:e") . ".tags"
	if filereadable(l:tags_file)
		execute "setlocal tags=" . l:tags_file
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