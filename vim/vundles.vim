" ========================================
" Vim plugins
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

" Dependencies of snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

" Git tools
Plugin 'tpope/vim-fugitive'
" Rails :/
Plugin 'tpope/vim-rails.git'
" Snippets for our use :)
Plugin 'garbas/vim-snipmate'
" Commenting and uncommenting stuff
Plugin 'tomtom/tcomment_vim'
" Vim Ruby
Plugin 'vim-ruby/vim-ruby'
" Surround your code :)
Plugin 'tpope/vim-surround'
" Every one should have a pair (Autogenerate pairs for "{[( )
Plugin 'jiangmiao/auto-pairs'
" Tab completions
Plugin 'ervandew/supertab'
" Fuzzy finder for vim (CTRL+P)
Plugin 'ctrlpvim/ctrlp.vim'
" For tests
Plugin 'janko-m/vim-test'
" Navigation tree
Plugin 'scrooloose/nerdtree'
" Dispatching the test runner to tmux pane
Plugin 'tpope/vim-dispatch'
" Match blocks and brackets
Plugin 'andymass/vim-matchup'

Plugin 'plasticboy/vim-markdown'
" Asynchronous Lint Engine
Plugin 'w0rp/ale'
" Open a file at line number file:23
Plugin 'kopischke/vim-fetch'

" Extended Session management
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" ack search
Plugin 'mileszs/ack.vim'

" Airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Add git status to NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"Filetype plugin indent on is required by vundle
filetype plugin indent on
