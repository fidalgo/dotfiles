" ========================================
" Vim plugins
" ========================================
"
" This file contains the list of plugins installed
call plug#begin('~/.vim/plugged')
" ########################################
" Vim visual improvements
" ########################################
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline' " Airline status bar
Plug 'vim-airline/vim-airline-themes'

" ########################################
" Vim plugins & enhancements
" ########################################
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'  " Add git status to NERDTree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder for vim
Plug 'junegunn/fzf.vim'
Plug 'kopischke/vim-fetch' " Open a file at line number file:23
Plug 'Yggdroot/indentLine' " Show vertical lines on indentation

" ########################################
" Language & Frameworks support
" ########################################
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'hashivim/vim-terraform'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" ########################################
" Git
" ########################################
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ########################################
" Linters and Fixers and language agnostic aids
" ########################################
Plug 'tomtom/tcomment_vim' " Commenting and uncommenting
Plug 'LunarWatcher/auto-pairs' " Autogenerate pairs for \"{[( )
Plug 'ervandew/supertab' " Tab completions
Plug 'andymass/vim-matchup' " Match blocks and brackets
Plug 'w0rp/ale' " Asynchronous Lint Engine

call plug#end()
