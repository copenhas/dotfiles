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

" NOTE: This should be first
" By default VIM starts up in VI compatibility mode but 
" it can interfere with some commands since they were not
" supported in VI. At this point there is no reason for it. 
set nocompatible


" Pathogen {

    " NOTE: We have to get pathogen setup before the filetype 
    " options to make sure it loads everything correctly

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

" }


" System {

    " For convenience, when we write changes to our vim profile
    " auto load them back into our vim session.
    if has('autocmd')
        autocmd bufwritepost .vimrc source $MYVIMRC
    endif
    
    " VIM will try to determine the filetype and setup extra settings
    " This will not work with compability mode on.
    filetype on

    " Once VIM knows what filetype you are editing it will
    " try to run the plug-in for that filetype. It will attempt to
    " load $HOME/.vim/ftplugin/<type>.vim
    filetype plugin on

    " Use the filetype to determine indention schemes
    filetype indent on


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
    no <C-h> <C-w>h  
    no <C-j> <C-w>j
    no <C-k> <C-w>k
    no <C-l> <C-w>l

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
    colorscheme molokai 

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

    " Lets us quickly search through all files in the current directory
    " recursively for the word the cursor is on.
    map <leader>gr :grep -r <cword> *<cr>

    " Recursively search for current word in the directory the file 
    " you are editing exists and down.
    map <leader>gd :grep -r <cword> %:p:h/*<cr>

" }


" FuzzyFinder {

    map <leader>s :FufFile<cr>

" }


" NERDTree {

    " NERDTree is an excellent directory browser plugin. Lets make it
    " quicker to access by mapping it to '<leader>f'. The <leader>
    " key is '\' by default. If taglist is loaded lets close it first
    map <leader>f :TagbarClose<cr>:NERDTreeToggle<cr>

    " Setup some file ignores
    let NERDTreeIgnore=['\.pyc$', '\.beam$']

" }


" tagbar {

    " tagbar gives you a buffer of the tags sorted by scope.
    " Check out Exuberant Tags project or :help tags for more info.
    " Use 'ctags -R' at your project root to generate tags.
    " Or add it to your build script

    " Since <leader>t is used to run tests lets map the tag list
    " to <leader>c for code tags (ctags). Also if NERDTree is 
    " loaded then lets close it before we open the tags
    map <leader>c :NERDTreeClose<cr>:TagbarToggle<cr>

" }


" Python {

    " ropevim gives us refactoring abilities for python
    " but so we can have an inclusive plugin installation
    " we included the python modules it depends on in its
    " directory. So we have to add that directory to VIM's 
    " PYTHONPATH manually
    "
    " To take advantage of these features it is highly recommended
    " to check out its project page:
    " http://bitbucket.org/agr/ropevim/src
    let $PYTHONPATH .= ":".$HOME."/.vim/bundle/ropevim/ftplugin/python/"

    " pyflakes uses the quickfix list by default but it will 
    " override all other uses of quickfix (such as :vimgrep or :make)
    " by default it's enabled, but since we are going to rely on
    " other plug-ins lets disable it
    let g:pyflakes_use_quickfix = 0

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

        " Compiler options use a plug-in to tie in the settings for
        " error output and making the program. You can do this in a
        " more manual fashion by setting the makeprg and errorformat
        " options yourself
        "
        " Nose is a test runner for python that uses conventions
        " to discover and run your tests. This plug-in ties it into
        " VIM to take advantage of quickfix lists 
        " :cc and :cl are useful commands
        autocmd FileType python compiler nose

    endif

" }


" Erlang {

    if has('autocmd')

        " vimerl can use the man pages for completion but with Homebrew 
        " they are located in a different directory then the expected
        " default: /usr/lib/erlang/man
        let g:erlangManPath="/usr/local/Cellar/erlang/R14B01/share/man"

        " Since we are using pathogen for bundle style plugin management
        " we have to set the location of the check file which is used
        " with the compiler
        let g:erlangCheckFile="~/.vim/bundle/vimerl/compiler/erlang_check_file.erl"

        " vimerl gives us omnicompletion based on erlang's natural
        " introspection abilities, so let's use it.
        autocmd FileType erlang set omnifunc=erlangcomplete#Complete

        " Erlang's 'equal to or less than' operator is backwards
        " when compared to...just about everything. Let's set an
        " abbreivation to do the swap for us.
        autocmd FileType erlang ab <= =< 

        " Setting the compiler explicitly
        autocmd FileType erlang compiler erlang

    endif

" }


" NOTE: Split this out when it becomes bigger
" General Development {

    " Look for a ctags file starting in current directory and 
    " working all the way up to root
    set tags=tags;/

    if has('autocmd')

        " VIM comes with 'batteries included' you could say Including
        " these auto-completion scripts for web Development
        " These are located in your vimruntime directory
        " check ':help vimruntime'
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd FileType sql set omnifunc=sqlcomplete#Complete
        autocmd FileType c set omnifunc=ccomplete#Complete
        autocmd FileType ruby set omnifunc=rubycomplete#Complete

    endif

    " Search up the path for a proj.vim file so we can wire in
    " extra settings on a per project basis.
    let proj_settings=findfile('proj.vim', '.;/')
    if filereadable(proj_settings)
        source `=proj_settings`
    endif

" }

" Syntastic Settings {

    " See the Syntastic documentation for more information
    " https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt

    " Enable the statusline, which appears
    " when syntax errors are detected
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " Signs are placed beside lines with syntax errors, where
    " a different sign is used for errors and warnings
    let g:syntastic_enable_signs=1

    " Automatically open and close the location list
    let g:syntastic_auto_loc_list=1

" }
