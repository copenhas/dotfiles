"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WARNING:
" No attempt has been made to confirm these settings work across
" VIM versions and platforms. Try them out on a throw away file before
" adopting them for general purpose.
"
"
" The .vimrc file is ran everytime a new VIM instance is started adn
" applies to all VIM instances (GUI and terminal). Use .gvimrc to 
" override or add settings for GUI.
"
" The file is broken down into groups of settings and each one
" should be documented to express the purpose behind the setting
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" System {

    " By default VIM starts up in VI compatibility mode but 
    " it can interfere with some commands since they were not
    " supported in VI. At this point there is no reason for it. 
    set nocompatible
    
    " VIM will try to determine the filetype and setup extra settings
    " This will not work with compability mode on.
    filetype on

    " Once VIM knows what filetype you are editing it will
    " try to run the plug-in for that filetype. It will attempt to
    " load $HOME/.vim/ftplugin/<type>.vim
    filetype plugin on

    " Use the filetype to determine indention schemes
    filetype indent on

    " By default the .vim directory follows a similar convention to
    " the Linux filesystem with special directories to put the
    " different bits of a plugin in (docs go in doc/ kind of thing)
    " so to help manage plugins better lets use the bundling idea
    " that pathogen allows you.
    "
    " Plugins now go in their each directory: .vim/bundles/<plugin>
    call pathogen#runtime_append_all_bundles()

    " Generates all the helptags for the bundles pathogen loads
    " You can then access topics with the normal ':h <search/topic>'
    call pathogen#helptags()

    " If VIM has been compiled with unicode support then lets use it
    " Taken from: http://vim.wikia.com/wiki/Working_with_Unicode
    if has("multi_byte")
        " termencoding is the encoding the keyboard input will be
        " understood as. We set it to what the encoding setting is
        " at now to try and avoid overriding locale info used for
        " your keyboard setup 
        if &termencoding == ""
            let &termencoding = &encoding
        endif

        " display things as utf-8
        set encoding=utf-8

        " by default files should use utf-8 and drop da bomb or
        " byte order mark so we can tell what encoding the file is in
        setglobal fileencoding=utf-8 bomb

        " when reading a file try to match the byte order mark of the
        " file, otherwise try utf-8, finally just plain ascii
        set fileencodings=ucs-bom,utf-8,latin1
    endif 

    " Remember a lot of commands so we can always find that 
    " one that worked
    set history=1000

    " Since we are programmers and we'll probably want to compile 
    " our code, lets map the ':make' command to <leader>b just
    " to make it a little easier.
    " Remember you can use ':cc' to jump to first error
    nnoremap <leader>b :make<cr>

    " Remap the tab key to do autocompletion or 
    " indentation depending on the context 
    " from http://www.vim.org/tips/tip.php?tip_id=102
    function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
    endfunction
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>
    inoremap <s-tab> <c-n>

" }


" Editing {

    " This is how many spaces a tab is counted as being. Default is 8.
    set tabstop=4

    " How many spaces to insert when indenting (doesn't mean 
    " using <tab>). This is used for autoindenting and the 
    " '>' and '<' indent commands
    set shiftwidth=4

    " To be consistent and easier going when editing code 
    " *cough* Python *cough*
    " let's always expand a tab to the number of spaces and not just a
    " visual thing. A lot of editors seem to work this way.
    set expandtab

    " We want to be able to backspace/delete over any 
    " tabbing/indenting, newlines, and where we started INSERT mode,
    " you know what you expect instead of the VI compatible backspacing
    set backspace=indent,eol,start

    " When we fold or unfold a block of text determine the block
    " delimiters via syntax. You can use 'za' to toggle a fold.
    " There are several other commands as well.
    " 'zM' to close all folds
    " 'zR' to open all folds
    set foldmethod=syntax

    " Lets map 'za' to spacebar while in NORMAL mode
    nnoremap <space> za<space>

    " By default I like to see all the code, but the first time
    " you try to fold something this will get toggled and all folding
    " well be on.
    set nofoldenable

    " Remember the past 1000 edits for supreme undo action
    set undolevels=1000

    " Without paste mode large blocks of text will get autoindented
    " if that feature is on and look terrible. Toggle it on before
    " pasting then off when done.
    set pastetoggle=<F2>

" }

" Buffers {
    
    " You use the Ctrl + w + movement to move focus between 
    " split buffers on screen. Just mapping it to the 
    " quicker Ctrl + movement.
    map <C-h> <C-w>h  
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l


    " Keeps buffers open when you start to edit another file. They
    " are just kept in the background or hidden from view. Access
    " the list of current buffers via ':ls', use ':buffer <number>'
    " to switch to that buffer
    set hidden

" }


" Styling {

    " Show us where the cursor is in the bottom lower right
    set ruler

    " Show us the current incomplete command in the bottom
    " status bar. This shows up to the left of the ruler.
    set showcmd

    " Show the line number before each line.
    set number

    " Use the filetype information to give us syntax highlighting.
    syntax enable
           
    " Using a custom color scheme. Custom schemes get loaded from
    " $HOME/.vim/colors. This would apply to all VIM instances.
    " Move this to .gvimrc or override there to have different 
    " color schemes
    colorscheme sonofobsidian 

" }


" Searching {

    " Highlights the first search match while you type
    set incsearch

    " We want to see all search results highlighted and not just
    " the current one we are on. 
    " Use ':noh' to diable the highlighting for the current search
    set hlsearch 

    " By default the search will ignore case
    set ignorecase

    " If the search phrase is of mixed case then the search
    " will be case sensitive
    set smartcase

    " To make it a little more convenient we'll map :noh to <cr>
    " but we'll do it only for NORMAL mode. Including the second
    " <cr> to make sure we don't override anything
    nnoremap <cr> :noh<cr><cr>

" }

" Python {

    if has('autocmd')
        " If we are editing a python file we want to make sure we
        " can visually see all the now important whitespace
        " Turn on the feature
        autocmd filetype python set list
        " Now customize it
        autocmd filetype python set listchars=tab:>.,trail:.,extends:#,nbsp:.

        " Also make sure the tabs get expanded to spaces
        autocmd filetype python set expandtab

        " The pythoncomplete plugin gives us much better autocompletion
        autocmd FileType python set omnifunc=pythoncomplete#Complete

        " Since python already uses indention to represent code
        " blocks we can get away with just setting the foldmethod
        " to indention for Python.
        autocmd FileType python set foldmethod=indent
    endif

" }

" NERDTree {

    " NERDTree is an excellent directory browser plugin. Lets make it
    " quicker to access by mapping it to '<leader>f'. The <leader>
    " key is '\' by default.
    map <leader>f :NERDTreeToggle<cr>

" }
