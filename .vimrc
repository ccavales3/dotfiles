call plug#begin('~/.vim/plugged')

Plug 'https://github.com/flazz/vim-colorschemes.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/neomake/neomake.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'takac/vim-hardtime'

call plug#end()

colorscheme molokai
hi VertSplit ctermfg=235 ctermbg=NONE
set fillchars+=vert:│
" set runtimepath^=~/.vim/bundle/ctrlp.vim
set number
set ic
set tabstop=2
set shiftwidth=2
set expandtab
" set autochdir
set autoread
" set noai
set clipboard=unnamed

" Filetype
au Bufread,BufNewFile *.feature set filetype=gherkin
au! Syntax gherkin source ~/.vim/cucumber.vim

au FileType css setlocal ts=2 sw=2 sts=2 et
au FileType scss setlocal ts=4 sw=4 sts=4 et
au FileType html setlocal ts=4 sw=4 sts=4 et omnifunc=
au FileType javascript setlocal ts=2 sw=2 sts=2 et
au FileType javascript.jsx setlocal ts=2 sw=2 sts=2 et
au Filetype json setlocal ts=2 sw=2 sts=2 et
au FileType markdown setlocal spell ts=4 sw=4 sts=4 et
au FileType yaml setlocal ts=2 sw=2 sts=2 et
au FileType java setlocal ts=4 sw=4 sts=4 noet au FileType go setlocal ts=4 sw=4 sts=4 noet
au FileType gitcommit setlocal spell textwidth=72
au FileType gherkin setlocal ts=2 sw=2 sts=2 et

" NERDTree opens automatically when vim starts
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" leader key bindings
let mapleader = ' '
nnoremap <leader>e :e.<cr>
nnoremap <leader>v :vs.<cr>
nnoremap <leader>h :Hexplore!<cr>
nnoremap <leader>c :CtrlP<cr>
nnoremap <leader>a :Ag <cr>
nnoremap <c-p> :FZF <cr>
nnoremap <leader>/ :History/ <cr>
nnoremap <leader>t :tabs<cr>
nnoremap <leader>l :vsp<cr>
nnoremap <leader>w :sp<cr>
map <c-n> :NERDTreeToggle<cr>
"neomake
nmap <leader>no :lopen<cr>
nmap <leader>nc :lclose<cr>
nmap <leader>n, :ll<cr>
nmap <leader>nn :lnext<cr>
nmap <leader>np :lprev<cr>
nmap <leader>nm :Neomake<cr>
nmap <leader>fj :%!python -m json.tool<cr>

"neomake
autocmd BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

let g:netrw_liststyle=3
let g:ctrlp_custom_ignore = 'node_modules'
let g:NERDTreeWinSize = 50
let g:NERDTreeShowBookmarks = 1

" Ag
" let g:ag_working_path_mode="r"

" ctrl+c to toggle highlight.
let hlstate=0
nnoremap <c-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" refresh vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END
nmap <silent> <leader>rr :source $MYVIMRC<CR>
