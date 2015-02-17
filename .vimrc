" dvorak friendly remappings
noremap u j
noremap e k
noremap E e
noremap t l
noremap U u
noremap ze zk
noremap zu zj


" I like to open the entire fold at once
noremap zo zO
noremap zc zC


" justify an entire paragraph with 'j'
noremap j gq}

" Some keybindings that from EMACS that I can't go without
inoremap <C-E> <End>
inoremap <C-A> <Home>
inoremap <C-l> <C-[>

" Better filename completion
cnoremap <Tab> <C-L><C-D>

" Various settings that I like
set backspace=eol,start,indent
set is
set autoindent
set textwidth=78
set whichwrap=b,s,h,l
set list
set listchars=tab:>-,trail:-,extends:\
set ruler
set showmatch
set hlsearch
set expandtab
set wildmenu
hi Search term=standout ctermfg=Black ctermbg=Yellow guifg=Black guibg=Yellow

filetype on
filetype indent on
filetype plugin indent on
syntax enable

" Needed to enable latex-suite on empty .tex files
let g:tex_flavor='latex'

:autocmd FileType c call Programming_settings()
:autocmd FileType c call C_Settings()
:autocmd FileType cpp call Programming_settings()
:autocmd FileType cpp call C_Settings()
:autocmd FileType java call Programming_settings()
:autocmd FileType javascript call Programming_settings()
:autocmd FileType python call Programming_settings()
:autocmd FileType pyrex call Programming_settings()
:autocmd FileType pov call Programming_settings()
:autocmd FileType htmlcheetah call Programming_settings()

:autocmd FileType html call HTML_settings()
:autocmd FileType css call HTML_settings(4)
:autocmd FileType scss call HTML_settings(4)
:autocmd FileType htmldjango call HTML_settings()
:autocmd FileType xhtml call HTML_settings()
:autocmd FileType psp call HTML_settings()
:autocmd FileType htmlcheetah call HTML_settings()

:autocmd FileType rst call ReST_settings()

:autocmd FileType vo_base colorscheme vo_dark
:autocmd FileType vo_base set guifont=Monospace\ 18
:autocmd FileType vo_base set nolist
:autocmd FileType gitcommit set tw=70

set path+=/usr/local/gtk2/include/gtk-2.0

function HTML_settings(...)
  let &sw = a:0 > 0 ? a:1 : 2
  set smarttab
  set softtabstop=4
  set textwidth=0
  set indentkeys+=!^F
  nnoremap <Tab> i<C-f><Down><Esc>
endfunction

function Programming_settings()
" Settings I like for programming
  set fo=tcrq
  set shiftwidth=4
  set softtabstop=4
  set autowrite

  " tab rejustifies a line
  set indentkeys+=!^F
  nnoremap <Tab> i<C-f><Down><Esc>
endfunction

function ReST_settings()
  set sw=4
  set sts=4
endfunction

function C_Settings()
  set cino=(0,t0
  set sts=8
  set sw=8
endfunction
