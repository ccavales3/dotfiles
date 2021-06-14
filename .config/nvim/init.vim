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
" Plug 'dense-analysis/ale'                                                 " https://github.com/dense-analysis/ale
" Plug 'zchee/deoplete-jedi'                                                " https://github.com/deoplete-plugins/deoplete-jedi
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }             " https://github.com/Shougo/deoplete.nvim 
Plug 'neoclide/coc.nvim', {'branch': 'release'}                             " https://github.com/neoclide/coc.nvim
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }               " https://github.com/Shougo/denite.nvim
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                       " https://github.com/junegunn/fzf
" Plug 'junegunn/fzf.vim'                                                   " https://github.com/junegunn/fzf.vim
Plug 'junegunn/gv.vim'                                                    " https://github.com/junegunn/gv.vim
" Plug 'davidhalter/jedi-vim'                                               " https://github.com/davidhalter/jedi-vim
Plug 'itchyny/lightline.vim'                                              " https://github.com/itchyny/lightline.vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }  " https://github.com/iamcco/markdown-preview.nvim
Plug 'preservim/nerdtree',                                                " https://github.com/preservim/nerdtree
Plug 'ryanoasis/vim-devicons'                                             " https://github.com/ryanoasis/vim-devicons
Plug 'Xuyuanp/nerdtree-git-plugin'                                        " https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'tmhedberg/simpylfold'                                               " https://github.com/tmhedberg/SimpylFold
Plug 'godlygeek/tabular'                                                  " https://github.com/godlygeek/tabular
Plug 'tpope/vim-commentary'                                               " https://github.com/tpope/vim-commentary
Plug 'sainnhe/sonokai'                                                    " https://github.com/sainnhe/sonokai
Plug 'tpope/vim-fugitive'                                                 " https://github.com/tpope/vim-fugitive
Plug 'airblade/vim-gitgutter'                                             " https://github.com/airblade/vim-gitgutter
Plug 'plasticboy/vim-markdown'                                            " https://github.com/plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'                                                  " https://github.com/tpope/vim-rhubarb
Plug 'tpope/vim-surround'                                                 " https://github.com/tpope/vim-surround
" -------------------------------------
" Plug 'ajmwagar/vim-deus'                                                  " https://github.com/ajmwagar/vim-deus
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
" set tabstop=2         " set tab to 2 spaces
" set textwidth=120     " set textwidth
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

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

" nerdtree
" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
autocmd BufEnter * call SyncTree()
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
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
"
" fugitive
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gr :GRead<cr>
nnoremap <leader>gm :GMove<cr>
nnoremap <leader>gw :Gbrowse<cr>

" fzf
" nnoremap <leader>a :Ag<cr>
" nnoremap <leader>c :Commits<cr>
" nnoremap <silent><leader>f :Files<cr>
" nnoremap <silent><leader>t :Filetypes<cr>

" ============================================================================ "
" ===                           DENITE SETUP                               === "
" ============================================================================ "
" Wrap in try/catch to avoid errors on initial install before plugin is available
" === Denite setup ==="
try
  " Use ripgrep for searching current directory for files
  " By default, ripgrep will respect rules in .gitignore
  "   --files: Print each file that would be searched (but don't search)
  "   --glob:  Include or exclues files for searching that match the given glob
  "            (aka ignore .git files)
  "
  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
  
  " Use ripgrep in place of 'grep'
  call denite#custom#var('grep', 'command', ['rg'])
  
  " Custom options for ripgrep
  "   --vimgrep:  Show results with every match on it's own line
  "   --hidden:   Search hidden directories and files
  "   --heading:  Show the file name above clusters of matches from each file
  "   --S:        Search case insensitively if the pattern is all lowercase
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
  
  " Recommended defaults for ripgrep via Denite docs
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  
  " Remove date from buffer list
  call denite#custom#var('buffer', 'date_format', '')
  
  " Custom options for Denite
  "   split                       - Use floating window for Denite
  "   start_filter                - Start filtering on default
  "   auto_resize                 - Auto resize the Denite window height automatically.
  "   source_names                - Use short long names if multiple sources
  "   prompt                      - Customize denite prompt
  "   highlight_matched_char      - Matched characters highlight
  "   highlight_matched_range     - matched range highlight
  "   highlight_window_background - Change background group in floating window
  "   highlight_filter_background - Change background group in floating filter window
  "   winrow                      - Set Denite filter window to top
  "   vertical_preview            - Open the preview window vertically
  
  let s:denite_options = {'default' : {
  \ 'split': 'floating',
  \ 'start_filter': 1,
  \ 'auto_resize': 1,
  \ 'source_names': 'short',
  \ 'prompt': 'λ ',
  \ 'highlight_matched_char': 'QuickFixLine',
  \ 'highlight_matched_range': 'Visual',
  \ 'highlight_window_background': 'Visual',
  \ 'highlight_filter_background': 'DiffAdd',
  \ 'winrow': 1,
  \ 'vertical_preview': 1
  \ }}
  
  " Loop through denite options and enable them
  function! s:profile(opts) abort
    for l:fname in keys(a:opts)
      for l:dopt in keys(a:opts[l:fname])
        call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
      endfor
    endfor
  endfunction
  
  call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === key mappings === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
"  imap <silent><buffer> <C-o>
"  \ <Plug>(denite_filter_quit)
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_update)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" ============================================================================ "
" ===                             COC SETUP                                === "
" ============================================================================ "
" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === key mappings === "
"   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-markdownlint',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-vetur'
      \ ]

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? '\<C-n>' :
"       \ <SID>check_back_space() ? '\<TAB>' :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? '\<C-p>' : '\<C-h>'

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? '\<C-y>' : '\<C-g>u\<CR>'

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent>,a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent>,e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent>,c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent>,o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent>,s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent>,j :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent>,k :<C-u>CocPrev<cr>
" Resume latest coc list
nnoremap <silent>,p :<C-u>CocListResume<cr>

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
" markdown-preview
nnoremap <silent><leader>md :MarkdownPreview<cr>
nnoremap <silent><leader>ms :MarkdownPreviewStop<cr>
" tabularize
if exists(':Tabularize')
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
"" vim-commentary
" comment out highlighting
vmap <c-_> gc<cr>
" vim-gitgutter
nnoremap <silent><leader>gg :GitGutterLineHighlightsToggle<cr>
" jump to next hunk
nmap <silent> <c-,> ]c<cr>
" jump to previous hunk
nmap <silent> <c-.> [c<cr>

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

let g:netrw_liststyle = 3
let g:ctrlp_custom_ignore = 'node_modules'
let g:NERDTreeWinSize = 50
let g:NERDTreeShowBookmarks = 1

" deoplete
" let g:deoplete#enable_at_startup = 1

"Jedi
" disable autocompletion, cause we use deoplete for completion
" let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = 'right'

" ALE
" Check Python files with flake8 and pylint.
" let b:ale_linters = ['flake8', 'mypy', 'pylint']
" let g:ale_sign_error = '●'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%][%severity%](%code%): %s'
" ALE pylint
" let g:ale_python_pylint_change_directory = 1
" let g:ale_python_pylint_use_global = 0

"" fzf
"if has("nvim")
"  " Escape inside a FZF terminal window should exit the terminal window
"  " rather than going into the terminal's normal mode.
"  autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
"endif
"" show fzf as a centered window
"let g:fzf_commits_log_options = '--graph --color=always
"  \ --format="%C(yellow)%h%C(red)%d%C(reset)
"  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'
"if has('nvim-0.4.0') || has("patch-8.2.0191")
"    let g:fzf_layout = { 'window': {
"                \ 'width': 0.9,
"                \ 'height': 0.7,
"                \ 'highlight': 'Comment',
"                \ 'rounded': v:false } }
"else
"    let g:fzf_layout = { 'window': 'silent botright 16split enew' }
"endif

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" simpylfold
" zm - fold all, zr - open all, zc - fold 1, l - open fold
" preview docstring in fold text
let g:SimpylFold_docstring_preview = 0
" fold doctrings
let g:SimpylFold_fold_docstring	 = 0
" fold doctrings (buffer local)
let b:SimpylFold_fold_docstring = 0
" fold imports
let g:SimpylFold_fold_import = 0
" fold imports (buffer local)
let b:SimpylFold_fold_import = 0
set foldlevel=1

" vim-deus settings
" set t_Co=256
" set termguicolors
"
" let &t_8f = '\<Esc>[38;2;%lu;%lu;%lum'
" let &t_8b = '\<Esc>[48;2;%lu;%lu;%lum'
"
" set background=dark    " Setting dark mode
" colorscheme deus
" let g:deus_termcolors=256

" sonokai
if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
" let g:sonokai_transparent_background = 1

colorscheme sonokai
let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'

" vim-instant-markdown
filetype plugin on
au FileType markdown setl shell=bash\ -i

" Ag
" let g:ag_working_path_mode="r"

" ctrl+c to toggle highlight.
" let hlstate=0
" nnoremap <c-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

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
