" ========================================
" Vim plugins
" ========================================
"
" This file contains the list of plugins installed
call plug#begin('~/.vim/plugged')

" Dependencies of snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

Plug 'garbas/vim-snipmate'

" Git tools
Plug 'tpope/vim-fugitive'

" Rails :/
Plug 'tpope/vim-rails'

" Commenting and uncommenting stuff
Plug 'tomtom/tcomment_vim'

" Vim Ruby
Plug 'vim-ruby/vim-ruby'

" Surround your code :)
Plug 'tpope/vim-surround'

" Every one should have a pair (Autogenerate pairs for "{[( )
Plug 'jiangmiao/auto-pairs'

" Tab completions
Plug 'ervandew/supertab'

" Fuzzy finder for vim (CTRL+P)
Plug 'ctrlpvim/ctrlp.vim'

" For tests
Plug 'janko-m/vim-test'

" Navigation tree
Plug 'scrooloose/nerdtree'

" Dispatching the test runner to tmux pane
Plug 'tpope/vim-dispatch'

" Match blocks and brackets
Plug 'andymass/vim-matchup'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Open a file at line number file:23
Plug 'kopischke/vim-fetch'

" Extended Session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" ack search
Plug 'mileszs/ack.vim'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'altercation/vim-colors-solarized'
" Add git status to NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()
