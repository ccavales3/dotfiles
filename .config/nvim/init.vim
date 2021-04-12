" need to install below for python setup----------------------
" pip install pynvim
" pip install jedi
" for fzf to work--------------------------
" brew install the_silver_searcher
" brew install ripgrep
" brew install bat
call plug#begin('~/.config/nvim/plugged') " https://github.com/junegunn/vim-plug
" function! DoRemote(arg)
"   UpdateRemotePlugins
" endfunction
" -------------------------------------
Plug 'dense-analysis/ale'                                                 " https://github.com/dense-analysis/ale
Plug 'zchee/deoplete-jedi'                                                " https://github.com/deoplete-plugins/deoplete-jedi
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }             " https://github.com/Shougo/deoplete.nvim 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                       " https://github.com/junegunn/fzf
Plug 'junegunn/fzf.vim'                                                   " https://github.com/junegunn/fzf.vim
Plug 'junegunn/gv.vim'                                                    " https://github.com/junegunn/gv.vim
Plug 'davidhalter/jedi-vim'                                               " https://github.com/davidhalter/jedi-vim
Plug 'itchyny/lightline.vim'                                              " https://github.com/itchyny/lightline.vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }  " https://github.com/iamcco/markdown-preview.nvim
Plug 'preservim/nerdtree',                                                " https://github.com/preservim/nerdtree
Plug 'tmhedberg/simpylfold'                                               " https://github.com/tmhedberg/SimpylFold
Plug 'godlygeek/tabular'                                                  " https://github.com/godlygeek/tabular
Plug 'tpope/vim-commentary'                                               " https://github.com/tpope/vim-commentary
Plug 'ajmwagar/vim-deus'                                                  " https://github.com/ajmwagar/vim-deus
Plug 'tpope/vim-fugitive'                                                 " https://github.com/tpope/vim-fugitive
Plug 'airblade/vim-gitgutter'                                             " https://github.com/airblade/vim-gitgutter
Plug 'plasticboy/vim-markdown'                                            " https://github.com/plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'                                                  " https://github.com/tpope/vim-rhubarb
Plug 'tpope/vim-surround'                                                 " https://github.com/tpope/vim-surround
" -------------------------------------
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}          " https://github.com/mg979/vim-visual-multi
" Plug 'flazz/vim-colorschemes'                                " already using vim-deus
" Plug 'tomtom/tcomment_vim' " gc comments
" Plug 'milkypostman/vim-togglelist'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}        " https://github.com/suan/vim-instant-markdown
"" vim-vsnip                                                   " https://github.com/hrsh7th/vim-vsnip
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()
"
" -------------------------------------

hi VertSplit ctermfg=235 ctermbg=NONE
set fillchars+=vert:│
" set autochdir       " set current working directory to current file
set autoread          " reloads file when changed in disk
set backupcopy=yes    " make a copy of the file and overwrite the original one
set clipboard=unnamed " references system clipboard for copy and paste
set expandtab         " pressing tab will use spaces
set ic                " ignore case when searching
set noai              " no auto indent when pasting code
set number            " display line number
set tabstop=2         " set tab to 2 spaces
" set textwidth=120     " set textwidth

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.jsonnet*      set filetype=c
au BufRead,BufNewFile *.libsonnet*    set filetype=c
au BufRead,BufNewFile todo*           set filetype=todo
au BufRead,BufNewFile *.txt           set filetype=todo

au FileType css setlocal ts=2 sw=2 sts=2 et
au FileType html setlocal ts=4 sw=4 sts=4 et omnifunc=
au FileType java setlocal ts=4 sw=4 sts=4 noet au FileType go setlocal ts=4 sw=4 sts=4 noet
au FileType javascript setlocal ts=2 sw=2 sts=2 et
au FileType javascript.jsx setlocal ts=2 sw=2 sts=2 et
au Filetype json setlocal ts=2 sw=2 sts=2 et
au FileType markdown setlocal spell ts=4 sw=4 sts=4 et
au FileType make setlocal sw=4 sts=4 noet nowrap
au FileType py setlocal ts=4 sw=4 sts=4 et
au FileType scss setlocal ts=2 sw=2 sts=2 et
au FileType yaml setlocal ts=2 sw=2 sts=2 et

" NERDTree opens automatically when vim starts
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" leader key bindings
let mapleader = ' '
nnoremap <leader>e :e.<cr>
nnoremap <leader>v :vs.<cr>
nnoremap <leader>h :Hexplore!<cr>
nnoremap <leader>? :History<cr>
nnoremap <leader>t :tabs<cr>
nnoremap <leader>l :vsp<cr>
nnoremap <leader>w :sp<cr>
map <c-n> :NERDTreeToggle<cr>

" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" fugitive
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gr :GRead<cr>
nnoremap <leader>gm :GMove<cr>
nnoremap <leader>gw :Gbrowse<cr>
" fzf
nnoremap <leader>a :Ag<cr>
nnoremap <leader>c :Commits<cr>
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>t :Filetypes<cr>
" markdown-preview
nnoremap <silent><leader>md :MarkdownPreview<cr>
nnoremap <silent><leader>ms :MarkdownPreviewStop<cr>
" tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" vim-commentary
vmap <c-_> gc<cr> " comment out highlighting
" vim-gitgutter
nnoremap <silent><leader>gg :GitGutterLineHighlightsToggle<cr>
nmap <silent> <c-,> ]c<cr> " jump to next hunk
nmap <silent> <c-.> [c<cr> " jump to previous hunk

"" ctrlp
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " comma delimited list of files to ignore

" change highlight color to blue
hi Search guibg=peru guifg=wheat
hi Search cterm=NONE ctermfg=Red ctermbg=LightCyan

" check spelling for *.md files
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red

let g:netrw_liststyle=3
let g:ctrlp_custom_ignore = 'node_modules'
let g:NERDTreeWinSize = 50
let g:NERDTreeShowBookmarks = 1

" deoplete
let g:deoplete#enable_at_startup = 1

"Jedi
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" ALE
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'mypy', 'pylint']
let g:ale_sign_error = '●'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%](%code%): %s'
" ALE pylint
let g:ale_python_pylint_change_directory = 1
" let g:ale_python_pylint_use_global = 0

" fzf
if has("nvim")
  " Escape inside a FZF terminal window should exit the terminal window
  " rather than going into the terminal's normal mode.
  autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif
" show fzf as a centered window
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'
if has('nvim-0.4.0') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.7,
                \ 'highlight': 'Comment',
                \ 'rounded': v:false } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif

" simpylfold
" zm - fold all, zr - open all, zc - fold 1, l - open fold
let g:SimpylFold_docstring_preview = 0  " preview docstring in fold text
let g:SimpylFold_fold_docstring	 = 0    " fold doctrings
let b:SimpylFold_fold_docstring = 0     " fold doctrings (buffer local)
let g:SimpylFold_fold_import = 0        " fold imports
let b:SimpylFold_fold_import = 0        " fold imports (buffer local)
set foldlevel=1

" vim-deus settings
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256

" vim-instant-markdown
filetype plugin on
au FileType markdown setl shell=bash\ -i

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

"tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" markdown-preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
