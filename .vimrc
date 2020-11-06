set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=/usr/share/vim/vimfiles/autoload/vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
Plugin 'morhetz/gruvbox'

Plugin 'airblade/vim-gitgutter'

Plugin 'preservim/nerdtree'

Plugin 'plasticboy/vim-markdown'

Plugin 'iamcco/markdown-preview.nvim'

call vundle#end()
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Encoding
set encoding=utf-8

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Allow mouse click to move cursor
set mouse=a

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Max chars per line
set colorcolumn=120
highlight ColorColumn ctermbg=darkgray

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Colorscheme
colorscheme gruvbox
set background=dark
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" Git gutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

set updatetime=250 " Update sign column every quarter second

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

"Switch between different windows by their direction`
no <C-j> <C-w>j| "switching to below window
no <C-k> <C-w>k| "switching to above window
no <C-l> <C-w>l| "switching to right window
no <C-h> <C-w>h| "switching to left window

let NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" plasticboy/vim-markdown
autocmd FileType markdown let conceallevel=0
autocmd FileType markdown normal zR

