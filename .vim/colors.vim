" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
set t_Co=256
syntax enable

set background=dark
if (has("termguicolors"))
    set termguicolors
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" let g:neodark#background = '#202020'
let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#solid_vertsplit = 1 " default: 0

" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
" Make the tab line much lighter than the background.
let g:badwolf_tabline = 3

colorscheme badwolf
hi Comment guifg=#5C6370 ctermfg=59
hi Comment cterm=italic
