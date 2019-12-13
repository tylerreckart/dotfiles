set encoding=utf-8

" Leader
let mapleader = ","
let g:mapleader = ","

" Remap split commands for faster window opening
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Remap window navigation to <tab> for faster window switching
nnoremap <tab> <C-w>
nnoremap <tab><tab> <C-w><C-w>

" Remap buffer switching
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

set background=dark

set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set modelines=0
set nomodeline
set cmdheight=1
set ignorecase
set smartcase
set hlsearch
set incsearch

set showmatch " Show matching brackets when text indicator is over them
set mat=2

" No annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set so=7 " Set 7 lines to the cursor when moving vertically using j/k

" Turn on syntax highlighting
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" if filereadable(expand("~/.vimrc.bundles"))
"   source ~/.vimrc.bundles
" endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing  file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler.
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{eslint}rc set filetype=json
augroup END

" Map autocomplete of surrounds
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>0
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" Delete trailing whitespace on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()

" Automatically format javscript files with Prettier
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG

call plug#begin('~/.vim/plugged')
  " Colors
  Plug 'rj-white/waterfall.vim'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Linting
  Plug 'w0rp/ale'

  " File Search
  Plug 'ctrlpvim/ctrlp.vim'

  " Git
  Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme waterfall

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1

" CtrlP
map <leader>j :CtrlP<CR>
let g:ctrlp_max_height=20


" Better tabbing
map <leader>nn :tabnew<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>
map <leader>x :tabclose<CR>

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

set textwidth=80
let &colorcolumn="80,".join(range(80,999),",")
highlight ColorColumn ctermbg=232

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine ctermbg=233

" Numbers
set number
set numberwidth=5

" Tab completion
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> like block tags
let g:html_indent_tags = 'li\|p'

set splitbelow
set splitright

