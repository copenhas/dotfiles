"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WARNING:
" No attempt has been made to confirm these settings work across
" VIM versions and platforms. Try them out on a throw away file before
" adopting them for general purpose.
"
"
" The .gvimrc file is ran everytime a new GUI VIM instance is 
" started. Use .vimrc to provide base settings for all VIM instances. 
"
" The file is broken down into groups of settings and each one
" should be documented to express the purpose behind the setting
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" System {

    " Setting the default size of the window to fit my environment
    set lines=156
    "set columns=119

" }


" Styling {

    " I don't want a scrollbar on the left when I have split windows
    " mostly because I use nerdtree and the <ctl>f/b commands
    set guioptions-=L

    " For that matter I don't want scrollbars on the right either.
    " Generally can tell if there is more to the file from other 
    " visuals.
    set guioptions-=R

    " I don't care for the little toolbar buttons at the top. This is VIM
    " I should be getting used to keyboard commands anyway.
    set guioptions-=T

" }
