if exists('g:tagsmatic_loaded')
	finish
endif
let g:tagsmatic_loaded = 1

let s:supported_languages = split(system('ctags --list-languages'))
let s:tags_dir = '.tags'

function s:GenerateTags()
	let l:language_is_supported = index(s:supported_languages, &filetype, 0, 1)
	if l:language_is_supported > -1
		if empty(glob(s:tags_dir))
			try
				call mkdir(s:tags_dir, 'p')
			catch
				echoerr "Can't create" s:tags_dir "folder"
				finish
			endtry
		endif

		execute "call jobstart('ctags -f .tags/" . &filetype . " --languages=" . &filetype . " --tag-relative=yes', {'detach': 1})"
		call s:SetTags()
	endif
endfunction

function s:SetTags()
	let l:tags_file = s:tags_dir . "/" . &filetype
	if (stridx(&tags, l:tags_file) < 0) && filereadable(l:tags_file)
		execute "setlocal tags+=" . l:tags_file
		" TODO: If HTML also load CSS tags file
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
