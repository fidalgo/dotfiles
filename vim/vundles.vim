" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" YADR's vundles are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/vundles/ to edit them:
"runtime ruby.vundle
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-rvm.git'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'skwp/vim-iterm-rspec'
Plugin 'skwp/vim-spec-finder'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'tpope/vim-bundler'


"runtime languages.vundle
Plugin 'briancollins/vim-jst'
Plugin 'pangloss/vim-javascript'
Plugin 'rodjek/vim-puppet'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'groenewege/vim-less.git'
Plugin 'itspriddle/vim-jquery.git'
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic.git'
Plugin 'garbas/vim-snipmate.git'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'skwp/vim-html-escape'
Plugin 'tpope/vim-haml'
Plugin 'honza/vim-snippets'


"runtime git.vundle
Plugin 'gregsexton/gitv'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'


"runtime appearance.vundle
Plugin 'chrisbra/color_highlight.git'
Plugin 'skwp/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'jby/tmux.vim.git'
Plugin 'morhetz/gruvbox'
"Plugin 'xsunsmile/showmarks.git'


"runtime textobjects.vundle
" These bundles introduce new textobjects into vim,
" For example the Ruby one introduces the 'r' text object
" such that 'var' gives you Visual Around Ruby
Plugin 'austintaylor/vim-indentobject'
Plugin 'bootleq/vim-textobj-rubysymbol'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'kana/vim-textobj-datetime'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-user'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thinca/vim-textobj-function-javascript'
Plugin 'vim-scripts/argtextobj.vim'

"runtime search.vundle
Plugin 'justinmk/vim-sneak'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'skwp/greplace.vim'
Plugin 'Lokaltog/vim-easymotion'


"runtime project.vundle
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimfiler.vim'

"runtime vim-improvements.vundle
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplete.git'
Plugin 'briandoll/change-inside-surroundings.vim.git'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'vim-scripts/camelcasemotion.git'
Plugin 'vim-scripts/matchit.zip.git'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Keithbsmiley/investigate.vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'bogado/file-line.git'
Plugin 'mattn/webapi-vim.git'
Plugin 'sjl/gundo.vim'
Plugin 'skwp/YankRing.vim'
Plugin 'tomtom/tlib_vim.git'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/AnsiEsc.vim.git'
Plugin 'vim-scripts/AutoTag.git'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'vim-scripts/sudo.vim'
Plugin 'goldfeld/ctrlr.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'

" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.yadr/vim/.vundles.local"))
  source ~/.yadr/vim/.vundles.local
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required

"Filetype plugin indent on is required by vundle
filetype plugin indent on
