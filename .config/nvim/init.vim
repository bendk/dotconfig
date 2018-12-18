" Leader mappings
let mapleader=","
" Leader mapping help
nmap <Leader>h <Plug>(FollowMyLead)
" Undotree
nmap <Leader>u :UndoTreeToggle<cr>
" oPen file
nmap <Leader>p :CtrlPMixed<CR>
" Delete Trailing Whitespace
nmap <Leader>w :DeleteTrailingWhitespace<CR>
" Format paragraph
nmap <Leader>f gqip
" Next buffer
nmap <Leader>bn :bn<cr>
" Prev buffer
nmap <Leader>bp :bp<cr>
" Delete buffer
nmap <Leader>bd :bd<cr>
" Change list
nmap <Leader>cl :cl<cr>
" Next change
nmap <Leader>cn :cn<cr>
" Previous change
nmap <Leader>cp :cp<cr>
" Current change
nmap <Leader>cc :cc<cr>
" Close changelist
nmap <Leader>cd :cclose<cr>
" Prev yank
nmap <leader>y <Plug>yankstack_substitute_older_paste
" Next yank
nmap <leader>Y <Plug>yankstack_substitute_newer_paste
" Argwrap
nmap <leader>a :ArgWrap<CR>
" Grep
nmap <leader>g :Ack<Space>
" Copy
vmap <leader>c "+y
" Paste
nmap <leader>v "+p
" Paste above
nmap <leader>V "+P

" Other mappings, not related to plugins:
" I use the arrow keys to move around.  Remap them to more useful things
map j <Nop>
map k <Nop>
map h <Nop>
map l <Nop>
" Jump tag
noremap jt *
" Jump definition
noremap jd <C-]>
" Jump match
noremap jm %
" Jump end
nnoremap je G
" Jump home
nnoremap jh gg
" Jump back
nnoremap jb ``
" Jump alternate
nnoremap ja :b#<CR>
" Jump by indent
map jIU <Plug>(IndentWisePreviousLesserIndent)
map jII <Plug>(IndentWisePreviousEqualIndent)
map jID <Plug>(IndentWisePreviousGreaterIndent)
map jIB <Plug>(IndentWiseBlockScopeBoundaryBegin)
map jiu <Plug>(IndentWiseNextLesserIndent)
map jii <Plug>(IndentWiseNextEqualIndent)
map jid <Plug>(IndentWiseNextGreaterIndent)
map jib <Plug>(IndentWiseBlockScopeBoundaryEnd)
" Jump to buffer
nmap jkh <Plug>AirlineSelectTab1
nmap jkt <Plug>AirlineSelectTab2
nmap jkn <Plug>AirlineSelectTab3
nmap jks <Plug>AirlineSelectTab4
nmap jkg <Plug>AirlineSelectTab5
nmap jkc <Plug>AirlineSelectTab6
nmap jkr <Plug>AirlineSelectTab7
nmap jkm <Plug>AirlineSelectTab8
nmap jkv <Plug>AirlineSelectTab9
" Swap arg left
nnoremap kl :SidewaysLeft<CR>
nnoremap kr :SidewaysRight<CR>

omap k <Plug>SidewaysArgumentTextobjA
xmap k <Plug>SidewaysArgumentTextobjA

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '1': 'H ',
      \ '2': 'T ',
      \ '3': 'N ',
      \ '4': 'S ',
      \ '5': 'G ',
      \ '6': 'C ',
      \ '7': 'R ',
      \ '8': 'M ',
      \ '9': 'V '
      \}

" Ctrl-P
let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_open_new_file = 'r'
" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'OEUIDHTN.PCRJKMWAS'
let g:EasyMotion_use_upper = 1
map <Space> <Plug>(easymotion-prefix)
map <Space><Space> <Plug>(easymotion-repeat)
map s <Plug>(easymotion-s)
" clever-f
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_chars_match_any_signs = 1
let g:clever_f_mark_char = 0
nmap ; <Plug>(clever-f-repeat-forward)
nmap , <Plug>(clever-f-repeat-back)
" Emmet
let g:user_emmet_expandabbr_key = '<C-e>'
imap <C-o> <C-e><Enter><Enter><Up><Tab>
" Buffer Jump
" nmap <Space> <Plug>BufferjumpStart

let completeopt="menuone,longest,preview"
" vim-gnupg
let g:GPGExecutable="gpg2"
" vim-ack
let g:ackprg = 'rg --vimgrep --smart-case'
" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map <Leader>/  <Plug>(incsearch-fuzzy-/)
map <Leader>?  <Plug>(incsearch-fuzzy-?)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" Indentwise
let g:indentwise_suppress_keymaps = 1
" Lion
let g:lion_squeeze_spaces = 1
" Don't go into ex mode
nmap Q <nop>
" Various settings that I like
set completeopt=menuone
set ignorecase
set smartcase
set hidden
set list
set listchars=tab:>-,trail:-,extends:\
set mouse=""
set expandtab
set wildmode=longest:full
set wildmenu
set wildignore="*.py"
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
" curl -flo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.config/nvim/plugged')
Plug 'bendk/vim-follow-my-lead'
Plug 'bling/vim-airline'
Plug 'jamessan/vim-gnupg'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'vim-scripts/undotree.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mileszs/ack.vim'
Plug '~/vim-bufferjump'
Plug 'wellle/targets.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'AndrewRadev/sideways.vim'
Plug 'tommcdo/vim-lion'
" syntax
Plug 'hynek/vim-python-pep8-indent'
Plug 'dag/vim-fish'
Plug 'chase/vim-ansible-yaml'
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()

let g:UltiSnipsExpandTrigger = "<C-t>"
let UltiSnipsJumpForwardTrigger = "<C-t>"
let UltiSnipsJumpBackwardTrigger = "<C-h>"

" Plugin Settings
let g:gitgutter_map_keys = 0
let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['c', 'C', 'd', 'D', 'y', 'Y']

" colors
set termguicolors
colorscheme bdk
