### This is profile is dead but I still use it for reference

Profiles
========

If you decide to use a full profile you might want to do a git checkout then just link the directories you want into your $HOME. Also I'm trying to use submodules where possible so you'll need to make sure to init and update them to pull the code. Checkout the .gitmodules file to see what are submodule.

### Overall Installation

    $ mkdir /path/for/dotfiles
    $ cd /path/for/dotfiles
    $ git init
    $ git checkout git://github.com/copenhas/dotfiles.git
    $ git submodule init
    $ git submodule update
    ...


vim
---

### Installation

Here are just some reminder commands for using git to grab the profiles and symlinking the ones wanted for use.

    $ ln -s /path/for/dotfiles/.vim $HOME/.vim
    $ ln -s /path/for/dotfiles/.vimrc $HOME/.vimrc
    $ ln -s /path/for/dotfiles/.gvimrc $HOME/.vimrc


### Description

I have started this profile from scratch to try and learn more about customizing VIM. I'm trying to keep it somewhat organized and documented for any who want to learn from it. 

This will probably turn into a VIM environment starter kit of somekind since I haven't really run across any so far.

Found these links helpful:

* [Coming Home To VIM](http://stevelosh.com/blog/2010/09/coming-home-to-vim/#a-language-of-text-editing)
* [Seven Habits for Effective Text Editing](http://www.moolenaar.net/habits.html)
* [A Byte of VIM](http://www.swaroopch.com/notes/Vim_en:Table_of_Contents)
* [VIM Docs](http://vimdoc.sourceforge.net/htmldoc/)
* [How I Boosted my VIM](http://nvie.com/posts/how-i-boosted-my-vim/)
* [Python unit test and VIM](http://blog.staz.be/post/2010/09/04/Python-unit-test-and-vim)

### Plugins Included:
General:

* pathogen - bundle style plugin management
* nerdtree - directory browing
* snipmate - snippets
* l9 - vim scripting library
* autocomplpop - auto-popup completion menu
* makegreen - uses test output to show a green/red bar at the bottom
* taglist - gives you code browsing with a ctags file
#### depends on `ctags`: consult your platform's package manager
* scmdiff - view diff between current file and previous in source control

C:

* a.vim - quickly switch between header and code files

Python:

* pyflakes - Python code checker (does error underline)
* pythoncomplete - Python code completion
* ropevim - Python refactoring tools
* nosecompiler - uses the nosetests command run tests based on convention
#### depends on `nose`: $ `sudo easy_install nose`

Erlang:

* vimerl - suite of scripts for erlang (completion, compiler, syntax, etc)

### VIM Profile TODO
* Python: think about splitting ropevim's python module out as a dependency like nose
* Python: think about splitting out pyflakes
* Ruby: everything! (code completion, refactoring, errorformat/makeprg, real-time error squiggles)
* JavaScript: everything!


bash
----

Nothing to see here.
