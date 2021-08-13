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

" Toggle Nerdtree
map <Leader>; :NERDTreeToggle<CR>

" Removes highlight of your last search
noremap <silent> <C-n> :nohl<CR>
vnoremap <silent> <C-n> :nohl<CR>
inoremap <silent> <C-n> <ESC>:nohl<CR>a

" "Faster" ESC :)
inoremap jk <Esc>
inoremap kj <Esc>

" Move to next window and maximize it with CTRL + HJKL
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>|
map <C-L> <C-W>l<C-W>|

" IndentLine (plugin)
noremap <Leader>p :IndentLinesToggle<CR>

" Run current file
autocmd FileType go nmap <leader>r  <Plug>(go-run)

autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <silent> <leader>e :GoAlternate<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <Leader>o <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"

" <leader>b inserts an ipdb breakpoint
map <Leader>bb Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let @v = 'f=aValue(string_value=f,i)0j'
map <C-m> f=aValue(string_value=f,i)0j
map <C-y> f=aValue(bool_value=f,i)0j
map <leader>t :b#<CR>
