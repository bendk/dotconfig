-- Really ugly code to make vim-sandwich work
--
local map = require('map')

function _G.my_sandwich_generic()
    vim.g['sandwich#magicchar#f#patterns'] = {
         {
           header = '\\<\\h\\k*',
           bra    = '<',
           ket    = '>',
           footer = '',
         },
    }
end

function _G.my_sandwich_function()
    vim.g['sandwich#magicchar#f#patterns'] = {
         {
           header = '\\<\\h\\k*',
           bra    = '(',
           ket    = ')',
           footer = '',
         },
    }
end

function _G.my_sandwich_generic_fname()
    return vim.fn['sandwich#magicchar#f#fname']():sub(1, -2) .. '<'
end

vim.cmd([[
    let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
    let g:sandwich#recipes += [ {'buns': ['v:lua.my_sandwich_generic_fname()', '">"'], 'kind': ['add', 'replace'], 'action': ['add'], 'expr': 1, 'input': ['g']},  ]
    let g:sandwich#recipes += [{'external': ["\<Plug>(my-sandwich-generic-ap)", "\<Plug>(my-sandwich-generic-a)"], 'noremap': 0, 'kind': ['delete', 'replace', 'query'], 'input': ['g']}]
    let g:sandwich#recipes += [ {'buns': ['sandwich#magicchar#f#fname()', '")"'], 'kind': ['add', 'replace'], 'action': ['add'], 'expr': 1, 'input': ['f']},  ]
    let g:sandwich#recipes += [{'external': ["\<Plug>(my-sandwich-function-ap)", "\<Plug>(my-sandwich-function-a)"], 'noremap': 0, 'kind': ['delete', 'replace', 'query'], 'input': ['f']}]
]])

map.map('xo', '<Plug>(my-sandwich-generic-ap)', '<cmd>call v:lua._G.my_sandwich_generic()<cr><Plug>(textobj-sandwich-function-ap)')
map.map('xo', '<Plug>(my-sandwich-generic-a)', '<cmd>call v:lua._G.my_sandwich_generic()<cr><Plug>(textobj-sandwich-function-a)')
map.map('xo', '<Plug>(my-sandwich-function-ap)', '<cmd>call v:lua._G.my_sandwich_function()<cr><Plug>(textobj-sandwich-function-ap)')
map.map('xo', '<Plug>(my-sandwich-function-a)', '<cmd>call v:lua._G.my_sandwich_function()<cr><Plug>(textobj-sandwich-function-a)')
