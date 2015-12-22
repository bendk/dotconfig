" smash escape
inoremap jk <Esc>

" Leader mappings
let mapleader=","
" Buffers
nnoremap <silent> <Leader>b :BufExplorer<CR>
" Yank History
noremap <Leader>y :Yanks<cr>
" Leader mapping help
nmap <Leader>h <Plug>(FollowMyLead)
nmap <Leader>u :UndoTreeToggle<cr>
" Close Window
nmap <Leader>w :bd<CR>
" Format paragraph
nmap <Leader>f gqip
" Toggle Search highlight
nmap <Leader>i :set hlsearch!<cr>
" Change list
nmap <Leader>cl :cl<cr>
" Next change
nmap <Leader>cn :cn<cr>
" Previous change
nmap <Leader>cp :cp<cr>
" Current change
nmap <Leader>cc :cc<cr>
" Prev yank
nmap <leader>p <Plug>yankstack_substitute_older_paste
" Next yank
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Autocomplete with tab
inoremap <Tab> <C-R>=pumvisible() ? "\<lt>C-p>" : "\<lt>Tab>"<CR>
" move by lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Various settings that I like
set completeopt=menuone
set ignorecase
set smartcase
set hlsearch
set list
set listchars=tab:>-,trail:-,extends:\
set mouse=""
set expandtab
set wildmode=longest:full
set wildmenu
colorscheme peachpuff
filetype on
filetype indent on
filetype plugin indent on
syntax enable

augroup LongLines
  autocmd!
  autocmd Filetype * match none
  autocmd Filetype python match ErrorMsg '\%>80v.\+'
augroup END

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'bendk/vim-follow-my-lead'
Plug 'bling/vim-airline'
Plug 'jamessan/vim-gnupg'
Plug 'justinmk/vim-sneak'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'vim-scripts/undotree.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'hynek/vim-python-pep8-indent'
Plug 'rking/ag.vim'
call plug#end()

let g:UltiSnipsExpandTrigger = "<C-t>"
let g:UltiSnipsListSnippets = "<C-s>"
let UltiSnipsJumpForwardTrigger = "<C-t>"
let UltiSnipsJumpForwardTrigger = "<C-h>"

" Plugin Settings
let g:gitgutter_map_keys = 0
let g:yankstack_map_keys = 0
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerDefaultHelp=0
let g:yankstack_yank_keys = ['c', 'C', 'd', 'D', 'y', 'Y']
let g:deoplete#enable_at_startup = 1
