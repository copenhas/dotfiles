Profiles
========

If you decide to use a full profile you might want to do a git checkout then just link the directories you want into your $HOME.

vim
---

I have started this profile from scratch to try and learn more about customizing VIM. I'm trying to keep it somewhat organized and documented for any who want to learn from it. 

This will probably turn into a VIM environment starter kit of somekind since I haven't really run across any so far. For right now I want to focus on getting a Python and Ruby environment going. Possibly C#/Mono after that.

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

Python:

* pyflakes - Python code checker (does error underline)
* pythoncomplete - Python code completion
* ropevim - Python refactoring tools
* nosecompiler - uses the nosetests command run tests based on convention
#### depends on `nose`: $ `sudo easy_install nose`

### VIM Profile TODO
* Learn more about ctags and how to tie them into projects easily
* Python: think about including nose with the profile
* Ruby: everything! (code completion, refactoring, errorformat/makeprg, real-time error squiggles)
* C#/Mono: everything! same as ruby
* Erlang: everything
