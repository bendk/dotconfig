" Vim color file - bdk

" 24 bit only for now
if !(has("gui_running") || (exists("+termguicolors") && &termguicolors))
  finish
endif

" Debugging help
"
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

nmap <Leader>s :call SynGroup()<CR>

set background=dark
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "bdk"

let s:colors = {}

let s:colors.white = 'ffffff'
let s:colors.nobel = '999999'
let s:colors.acadia = '777777'
let s:colors.blackpearl = '090c0d'
let s:colors.greypearl = '0F1516'
let s:colors.oxfordblue = '273338'

let s:colors.mayablue = '639df9'
let s:colors.mustard = 'ffd951'
let s:colors.pumpkin = 'ff7818'
let s:colors.darkred = '8f0000'
let s:colors.turquoise = '6bead7'

function! s:HL(group, fg, bg, ...)
  let attrs = (a:0 >= 1) ? a:1 : ''

  let histring = 'hi ' . a:group

  if strlen(a:fg)
      if a:fg == 'fg'
          let histring .= ' guifg=fg'
      else
          let c = get(s:colors, a:fg)
          let histring .= ' guifg=#' . c
      endif
  endif

  if strlen(a:bg)
      if a:bg == 'bg'
          let histring .= ' guibg=bg'
      else
          let c = get(s:colors, a:bg)
          let histring .= ' guibg=#' . c
      endif
  endif

  if strlen(attrs)
      let histring .= ' gui=' . attrs
  else
      let histring .= ' gui=NONE'
  endif

  execute histring
endfunction

call s:HL('Normal', 'white', 'blackpearl')
call s:HL('Constant', 'turquoise', 'bg')
call s:HL('Statement', 'mustard', 'bg')
call s:HL('PreProc', 'mayablue', 'bg')
call s:HL('Function', 'mayablue', 'bg')
call s:HL('Identifier', 'mayablue', 'bg')
call s:HL('String', 'pumpkin', 'bg')
call s:HL('Comment', 'nobel', 'bg')
call s:HL('NonText', 'nobel', 'bg')
call s:HL('Type', 'turquoise', 'bg')
call s:HL('SpecialKey', 'acadia', 'bg')

call s:HL('Search', 'darkred', 'mustard')
call s:HL('IncSearch', 'darkred', 'mustard')

call s:HL('Error', 'white', 'darkred')
call s:HL('ErrorMsg', 'white', 'darkred')
call s:HL('WarningMsg', 'white', 'darkred')

call s:HL('PMenu', 'fg', 'greypearl')
call s:HL('PMenuSel', 'blackpearl', 'pumpkin')
call s:HL('PmenuSbar', 'fg', 'greypearl')
call s:HL('PmenuThumb', 'fg', 'oxfordblue')
