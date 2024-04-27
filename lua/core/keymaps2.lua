vim.cmd([[
set nocompatible
syntax enable

set guicursor=n-v-c-i:block

set ttyfast
"set lazyredraw
set hidden

set smartcase
set ignorecase

set history=5555

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set hlsearch
set incsearch
nnoremap <silent> <Esc> :nohls<CR>

set autoindent
set autoread

set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

filetype on
filetype plugin indent on

set number
set relativenumber

set ruler
set mouse=a

set so=7
set sidescroll=1
set sidescrolloff=2

set noscrollbind
set nocursorbind

set noerrorbells visualbell t_vb=

set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=50

set wildmenu
set wildmode=longest:full,full
set wildoptions=pum,tagfile
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.flv,*.img,*.xlsx,*~,*.pyc,*/.git/*,*.o,*.obj,*.rbc,__pycache__
set wildignore+=*swp,*.class,*.png,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so
set wildignore+=*\\tmp\\*,*.exe

set cursorline
set signcolumn=yes

set shell=$SHELL
set viminfo^=!

set nolangnoremap

set clipboard=unnamedplus,unnamed

set t_Co=256
set background=dark

set shortmess+=c
set complete-=i

set nobackup
set nowritebackup
set noswapfile

"set undofile
"set undodir=~/.vim/undodir
"set undolevels=1000

set notitle
set noshowmode
set showtabline=0
set showcmd
set cmdheight=1

set modeline
set modelines=1

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap yG ggyG
nnoremap dG ggdG

cnoremap <C-a> <Home>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <leader><Enter> !!bash<CR>

nnoremap ; :
nnoremap : ;

set splitright
set splitbelow

set textwidth=79
set laststatus=2
set whichwrap+=<,>,h,l,[,]


set showmatch
set matchtime=4
set matchpairs+=<:>
runtime macros/matchit.vim

set display+=lastline,truncate

setglobal tags-=./tags tags-=./tags; tags^=./tags;

vmap > >gv
vmap < <gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

noremap <silent> n nzzzv:call BlinkMatch(0.2)<CR>
noremap <silent> N Nzzzv:call BlinkMatch(0.2)<CR>

nnoremap / /\v
vnoremap / /\v

nnoremap <expr> j v:count ? (v:count > 7 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 7 ? "m'" . v:count : '') . 'k' : 'gk'

highlight MatchParen ctermbg=4 ctermfg=15
highlight CursorLine term=bold ctermbg=grey ctermfg=black

set tabpagemax=50

nnoremap <S-l> :bnext<cr>
nnoremap <S-h> :bprevious<cr>

nnoremap <leader><bar> <C-w>v<C-w>l
nnoremap <leader>- <C-w>s

nnoremap gl `.zz
nnoremap gV `[V`]

nnoremap <silent> <leader>Q :q!<CR>
nnoremap <leader>W :w!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

map <leader>ss :set :setlocal spell! spelllang=en_us<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

nnoremap ]c :cnext<cr>
nnoremap [c :cprevious<cr>

nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d
nnoremap <silent> <leader>c "_c
vnoremap <silent> <leader>c "_c)"
vnoremap <silent> p "_dp
vnoremap <silent> P "_dP
]])
