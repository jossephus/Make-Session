command! -nargs=? MakeSession
	    \ call MakeSession#MakeNewSession(<f-args>)

command! -nargs=0 LoadLatestSession
	    \ call MakeSession#LoadLatestSession()

command! -nargs=? -complete=customlist,MakeSession#complete_session_names LoadSession
	    \ call MakeSession#LoadSession(<f-args>)

let g:MakeSession_dir = "$HOME/.vim/.sessions/"
