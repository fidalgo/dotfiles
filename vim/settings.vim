" ========================================
" Vim plugins configuration
" ========================================

" Appearance
syntax enable
set background=dark
colorscheme solarized


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
