call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Scala plugins
if executable('scalac')
  Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
endif

Plug 'ensime/ensime-vim', { 'do': function('DoRemote') }
Plug 'ktvoelker/sbt-vim'
" Plug 'roxma/nvim-yarp'
Plug 'ajmwagar/vim-deus'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'neomake/neomake', { 'for': ['rust', 'haskell', 'typescript'] }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
" Plug 'https://github.com/tpope/vim-obsession.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'tomtom/tcomment_vim' " gc comments
Plug 'tpope/vim-surround'
Plug 'milkypostman/vim-togglelist'
" Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" colorscheme Tomorrow-Night

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

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.jsonnet*      set filetype=c
au BufRead,BufNewFile *.libsonnet*    set filetype=c
au BufRead,BufNewFile todo*           set filetype=todo
au BufRead,BufNewFile *.txt           set filetype=todo


" NERDTree opens automatically when vim starts
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" leader key bindings
let mapleader = ' '
nnoremap <leader>e :e.<cr>
nnoremap <leader>v :vs.<cr>
nnoremap <leader>h :Hexplore!<cr>
nnoremap <leader>a :Ag <cr>
nnoremap <c-p> :Files <cr>
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

" Neomake
" Gross hack to stop Neomake running when exitting because it creates a zombie cargo check process
" which holds the lock and never exits. But then, if you only have QuitPre, closing one pane will
" disable neomake, so BufEnter reenables when you enter another buffer.
let s:quitting = 0
au QuitPre *.rs let s:quitting = 1
au BufEnter *.rs let s:quitting = 0
au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
au QuitPre *.ts let s:quitting = 1
au BufEnter *.ts let s:quitting = 0
au BufWritePost *.ts if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
let g:neomake_warning_sign = {'text': '?'}

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

