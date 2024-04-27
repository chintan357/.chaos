vim.cmd([[
syntax enable

set guicursor=n-v-c-i:block


nnoremap <silent> <Esc> :nohls<CR>


filetype on
filetype plugin indent on


set ruler
set mouse=a

set so=7
set sidescroll=1




set wildoptions=pum,tagfile
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.flv,*.img,*.xlsx,*~,*.pyc,*/.git/*,*.o,*.obj,*.rbc,__pycache__
set wildignore+=*swp,*.class,*.png,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so
set wildignore+=*\\tmp\\*,*.exe





set t_Co=256
set background=dark

set complete-=i


"set undofile
"set undodir=~/.vim/undodir
"set undolevels=1000


nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


cnoremap <C-a> <Home>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


set textwidth=79
set laststatus=2


set display+=lastline,truncate

setglobal tags-=./tags tags-=./tags; tags^=./tags;


noremap <silent> n nzzzv:call BlinkMatch(0.2)<CR>
noremap <silent> N Nzzzv:call BlinkMatch(0.2)<CR>

nnoremap / /\v
vnoremap / /\v


"highlight MatchParen ctermbg=4 ctermfg=15
"highlight CursorLine term=bold ctermbg=grey ctermfg=black

set tabpagemax=50

nnoremap <leader><bar> <C-w>v<C-w>l
nnoremap <leader>- <C-w>s

nnoremap gl `.zz
nnoremap gV `[V`]

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

map <leader>ss :set :setlocal spell! spelllang=en_us<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d
nnoremap <silent> <leader>c "_c
vnoremap <silent> <leader>c "_c
vnoremap <silent> p "_dp
vnoremap <silent> P "_dP

nnoremap ]c :cnext<cr>
nnoremap [c :cprevious<cr>

nnoremap <S-l> :bnext<cr>
nnoremap <S-h> :bprevious<cr>

nnoremap <leader><Enter> !!bash<CR>

nnoremap ; :
nnoremap : ;

]])
