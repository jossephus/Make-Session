# MakeSession

> VSCODE, Sublime, ... like last working directory remembering for VIM
> When finishing up working for the day, run :MakeSession before closing VIM, so you can start where you left off the next time you open vim

"This VIM Plugin was written last year when I didn't have an Internet access, Simple plugin with only Two Commands "

# Installing
- please use your favourite package manager, [Here is how u can install with [Vundle](https://github.com/VundleVim/Vundle.vim)]
```vimscript
    Plugin 'jossephus/Make-Session'
```


# Commands
- MakeSession
	- makes session
	- saves it in ~/.vim/.sessions directory
- LoadSession
	- loads the last saved session

# Do you want VIM to automatically load your session
- add this autocmd to your vimrc

```vimscript
    augroup save_when_leaving_load_when_entering
        autocmd!
        autocmd StdinReadPre * let s:std_in = 1
        autocmd VimEnter * if argc() == 0 | exe "LoadLatestSession" | endif
        autocmd QuitPre  * :MakeSession
    augroup END  
```
