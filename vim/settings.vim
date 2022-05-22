" ========================================
" Vim plugins configuration
" ========================================

" Appearance
syntax enable
set background=dark
autocmd vimenter * ++nested colorscheme solarized8
set guifont=Inconsolata\ 12

" disable markdown folding
let g:vim_markdown_folding_disabled = 1

" Use ripgrep if available in ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg -i %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
  " ack
  let g:ackprg = 'rg -i --vimgrep'
endif

" Airline
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_mode_map = {
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ 'c'  : 'CMD',
      \ '' : 'VB',
      \ }
" Show the current working directory folder name
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
" Just show the file name
let g:airline_section_c = '%{expand("%:p:h:t")}/%t'
let g:airline_section_y = ''
"let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3'
"let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'warning', 'c' ],
      \ [ 'x', 'y', 'z' ]
      \ ]

" AutoTag
" Seems to have problems with some vim files
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"

" ALE
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters = {
      \'ruby': ['rubocop'],
      \'eruby': ['erubi'],
      \'yaml': ['prettier'],
      \'json': ['prettier'],
      \'javascript': ['prettier'],
      \'rust': ['rustc', 'cargo'],
      \'terraform': ['terraform'],
      \}
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \'ruby': ['rubocop'],
      \'yaml': ['prettier'],
      \'json': ['prettier'],
      \'javascript': ['prettier'],
      \'rust': ['rustfmt'],
      \'terraform': ['terraform'],
      \}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 2000 " lint every 2secs
let g:ale_rust_cargo_use_check = 1

" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)
" NERDTree syntax highlight
let g:NERDTreeFileExtensionHighlightFullName = 1

" Disable asking for saving/loading sessions
let g:session_autosave = 0
let g:session_autoload = 0

" use the new format for Snipmate
let g:snipMate = { 'snippet_version' : 1 }

" fzf bindings
nnoremap \ :Rg<CR>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>b :Buffers<cr>

" CamelCaseMotion
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e
sunmap W
sunmap B
sunmap E

" Based on the RipgrepFzf function, will search using RipGrep on search term
function! RipgrepSearch(fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let search = getreg('/')
  " translate vim regular expression to perl regular expression.
  let search = substitute(search, '\(\\<\|\\>\)', '\\b', 'g')
  let initial_command = printf(command_fmt, shellescape(search))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', search, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RgS call RipgrepSearch(<bang>0)

" vim gutter
highlight! link SignColumn LineNr
