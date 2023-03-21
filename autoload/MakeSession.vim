function! s:getLatestId()
    if !exists("g:MakeSession_dir")
	let g:MakeSession_dir = "$HOME/.vim/.sessions/"
    endif
    if !isdirectory(expand(g:MakeSession_dir))
	" this is the first time running this session
	call mkdir(expand(g:MakeSession_dir))
	return 0
    endif

    let sessions = map(readdir(expand(g:MakeSession_dir)), "str2nr(substitute(v:val, '.vim', '' , ''))")

    if len(sessions) == 0
	return 0
    endif

    return max(sessions)
endfunction

function! MakeSession#MakeNewSession(...)
    if a:0 != 0 
	let sessionId = a:1
    else
	let sessionId = s:getLatestId() + 1
    endif

    if sessionId !~? "\v\.vim$"
	let sessionId .= ".vim"
    endif

    exe "mksession " . expand(g:MakeSession_dir) .  sessionId
endfunction

function! MakeSession#LoadLatestSession()
    let sessionId = s:getLatestId()

    if !sessionId
	echo "You do not have any saved sessions"
	return 
    endif

    if sessionId !~? "\v\.vim$"
	let sessionId .= ".vim"
    endif

    exe "source " . expand(g:MakeSession_dir) .  sessionId
endfunction

function! MakeSession#LoadSession(...)
    if a:0 != 0
	let sessionId = a:1
    else
	return MakeSession#LoadLatestSession()
    endif

    if sessionId !~? "\v\.vim$"
	let sessionId .= ".vim"
    endif

    exe "source " . expand(g:MakeSession_dir) .  sessionId
endfunction

function! MakeSession#complete_session_names(A, L, P)
    return filter(map(readdir(expand(g:MakeSession_dir)), "substitute(v:val, '.vim', '', '')"), "str2nr(v:val) == 0")
endfunction
