" ========================================
" Vim plugins configuration
" ========================================

" Appearance
syntax enable
set background=dark
colorscheme solarized
set guifont=Inconsolata\ 10

" Use ripgrep if available in ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" AutoTag
" Seems to have problems with some vim files
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"

" CamelCaseMotion
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e
sunmap W
sunmap B
sunmap E
