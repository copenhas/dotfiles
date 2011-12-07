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

    "auto load this config if it changes
    if has('autocmd')
        autocmd bufwritepost .gvimrc source $MYGVIMRC
        " for windows
        autocmd bufwritepost _gvimrc source $MYGVIMRC
    endif

    "max out the gvim window
    set lines=999
    set columns=999

    " always default the font to courier new
    if has("gui_gtk2")
        set guifont=Courier\ New\ 10
    elseif has("gui_photon")
        set guifont=Courier\ New:s10
    elseif has("gui_kde")
        set guifont=Courier\ New/10/-1/5/50/0/0/0/1/0
    elseif has("x11")
        set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    else
        set guifont=Courier_New:h10:cDEFAULT
    endif

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
