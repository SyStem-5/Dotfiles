packloadall
packadd! onedark.vim

set hidden

call plug#begin()

" Start screen for Vim
Plug 'mhinz/vim-startify'

"Development version of core markdown syntax.
" Plug 'tpope/vim-markdown'

" Set up the NodeJS plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" To install RustLang autocomplete, hinting, ... -> CocInstall coc-rust-analyzer

" Theme setup
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

Plug 'dense-analysis/ale'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Symbol autoclose plugin
Plug 'cohama/lexima.vim'

" TODO: 
" FIX:
" NOTE:
" HACK:
" PERF:
" WARNING:
" highlighting
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
call plug#end()

" This is supposed to fix ALE inputs?
" set completeopt=menu,menuone,preview,noselect,noinsert

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

set number
set relativenumber
set shiftwidth=4
set expandtab

set termguicolors
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline = 'onedark'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '

syntax on
colorscheme onedark

set splitbelow
set splitright
"

" ALE config
let g:ale_lint_on_text_changed = 'always'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""

" LanguageClient
let g:LanguageClient_serverCommands = {
\ 'c': ['clangd'],
\ 'cpp': ['clangd'],
\ }

"let b:ale_linters = ['flake8']
let b:ale_linters = ['pyright']
let b:ale_fixers = ['yapf']

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> mi :call LanguageClient#explainErrorAtPoint()<CR>
""

" Moving lines Up-Down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
""

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <A-l> :nohl<CR><C-L>

" Buffer switching
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Popupmenu-keys
" CTRL-N -> Next autocompletion
" CTRL-P -> Previous autocompletion

