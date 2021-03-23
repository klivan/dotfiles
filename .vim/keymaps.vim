" Rebind <Leader> key
let mapleader = ","

" Use Tab and Shift+Tab to go through buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Use qq in normal mode to close current buffer
nmap <silent> qq :bp <BAR> bd #<CR>

" Show list of files
map <leader>f :Files<cr>

" Show all open buffers and their status
nmap <leader>l :Buffers<CR>

" <leader>= to make all splits of equal size
nnoremap <silent> <leader>=  <C-w>=

" Vimrc editing
nnoremap <silent><leader>ev :split $MYVIMRC<cr>
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" insert corrections
iabbr fnuction function
iabbr ture true
iabbr flase false
iabbr shoudl should
iabbr shoyld should
iabbr Groyp Group
iabbr Groyps Groups
iabbr groyp group
iabbr groyps groups

" map sort function to a key
vnoremap <leader>s :sort<cr>

" If you're trying to write a file and forgot to run `sudo vim ...` you can run `:w!!` to get asked for a sudo pass
cmap w!! %!sudo tee > /dev/null %

" Delete trailing spaces at the end of current line
map <leader><space> :s/\s\+$//<CR>

" Better Replace:
" Use <leader>c to replace a text without writing text to unnamed register
" noremap <Leader>d "_d
noremap <Leader>c "_c

" Open/Close ALL folds
noremap <Leader>[ zR
noremap ; zR
noremap <Leader>] zM

" Center next match during search
noremap n nzz
noremap N Nzz

" Keep selection after indenting
xnoremap <  <gv
xnoremap >  >gv
xnoremap =  >gv
" Fast single-line indent
nnoremap = ==
nnoremap < <<
nnoremap > >>

" Search for a word under the cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Show tag bar
nmap <silent> <leader>i :TagbarToggle<CR>
