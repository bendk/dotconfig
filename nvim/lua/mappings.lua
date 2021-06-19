local map = require('map')

map.map('', 'j', map.plug('(easymotion-bd-f)'))
map.map('', 'h', map.call_lua('help', 'show_window()'))
map.map('n', '<esc>', ':nohls<cr>')
map.map('n', '.', '<Plug>(operator-sandwich-predot)<Plug>(RepeatDot)')
-- Sandwich
map.map('n', 'ds', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)')
map.map('n', 'dss', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)')
map.map('n', 'cs', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)')
map.map('n', 'css', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)')
map.map('nx', 's', '<Plug>(operator-sandwich-add)')
-- g -> "Goto"
map.map('', 'gh', 'gg') -- "go home"
map.map('', 'ge', 'G') -- "go end"
map.map('n', 'gl', map.call('feedkeys(":")')) -- "goto line"
map.map('n', 'gt', '*') -- "Goto token"
map.map('n', 'gp', map.command('cp')) -- "Quickfix prev"
map.map('n', 'gn', map.command('cn')) -- "Quickfix next"
map.map('n', 'gfp', map.command('cpf')) -- "Quickfix file-prev"
map.map('n', 'gfn', map.command('cnf')) -- "Quickfix file-next"
map.map('n', 'gcc', map.command('cc')) -- "Quickfix current"
map.map('n', 'gco', map.command('copen')) -- "Quickfix show"
map.map('n', 'jp', '<c-o>') -- Jumplist prev
map.map('n', 'jn', '<c-i>') -- Jumplist prev
-- x -> "eXtra actions"
map.map('', 'xw', '<plug>(polyword-miniword-w)')
map.map('', 'xb', '<plug>(polyword-miniword-b)')
map.map('', 'xe', '<plug>(polyword-miniword-e)')
map.map('', 'xge', '<plug>(polyword-miniword-ge)')
map.map('', 'W', '<plug>(polyword-megaword-w)')
map.map('', 'B', '<plug>(polyword-megaword-b)')
map.map('', 'E', '<plug>(polyword-megaword-e)')
map.map('', 'gE', '<plug>(polyword-megaword-ge)')
map.map('', 'xnc', '<plug>(polyword-transform-camel)')
map.map('', 'xns', '<plug>(polyword-transform-snake)')
map.map('', 'xnk', '<plug>(polyword-transform-kebab)')
map.map('', 'xnC', '<plug>(polyword-transform-pascal)')
map.map('', 'xnS', '<plug>(polyword-transform-snake-upper)')
map.map('', 'xnK', '<plug>(polyword-transform-kebab-upper)')
map.map('n', 'x,p', '<plug>(swap-prev)')
map.map('n', 'x,n', '<plug>(swap-next)')
map.map('nx', 'x,i', '<plug>(swap-interactive)')
map.map('nx', 'x,e', '<cmd>ArgWrap<cr>')
map.map('n', 'xa', '<Plug>LionRight')
map.map('x', 'xa', '<Plug>VLionRight')
map.map('nx', 'xc', '<plug>TComment_gc')
map.map('n', 'xcc', '<plug>TComment_gcc')
-- text objects
map.map('xo', 'im', '<plug>(polyword-miniword-iw)')
map.map('xo', 'am', '<plug>(polyword-miniword-aw)')
map.map('xo', 'iW', '<plug>(polyword-megaword-iw)')
map.map('xo', 'aW', '<plug>(polyword-megaword-aw)')
map.map('xo', 'i,', '<plug>(swap-textobject-i)')
map.map('xo', 'a,', '<plug>(swap-textobject-a)')
map.map('xo', 'is', '<plug>(textobj-sandwich-query-i)')
map.map('xo', 'as', '<plug>(textobj-sandwich-query-a)')
map.map('xo', 'iss', '<plug>(textobj-sandwich-auto-i)')
map.map('xo', 'ass', '<plug>(textobj-sandwich-auto-a)')

-- To/find
map.multi_map('', map.CHARACTER_KEYCODES, 'f%s', map.call_lua('find', 'find_forward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 't%s', map.call_lua('find', 'to_forward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 'F%s', map.call_lua('find', 'find_backward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 'T%s', map.call_lua('find', 'to_backward([[%s]])'))
-- Make forward finding inclusive
map.multi_map('o', map.CHARACTER_KEYCODES, 'f%s', 'v' .. map.call_lua('find', 'find_forward([[%s]])'))
map.multi_map('o', map.CHARACTER_KEYCODES, 't%s', 'v' .. map.call_lua('find', 'to_forward([[%s]])'))
-- Repeat last f/t
map.map('', ';', map.call_lua('find', 'repeat_find()'))

-- paste/yank/delete to/from register
map.multi_map('nx', map.LETTER_KEYCODES, 'xp%s', '"%sp')
map.multi_map('nx', map.LETTER_KEYCODES, 'xP%s', '"%sP')
map.multi_map('nx', map.LETTER_KEYCODES, 'xy%s', '"%sy')
map.multi_map('nx', map.LETTER_KEYCODES, 'xd%s', '"%sd')
-- paste/yank/delete to/from clipboard/selection
map.multi_map('nx', {'p', 'P', 'y', 'd'}, 'x%sc', '"+%s')
map.multi_map('nx', {'p', 'P', 'y', 'd'}, 'x%ss', '"*%s')

-- f format

-- Unmap keys that I don't want to use
map.map('', 'gg', '<nop>')
map.map('', 'G', '<nop>')
map.map('', 'Q', '<nop>')

-- Disable default plugin mappings
vim.g.swap_no_default_key_mappings = true
vim.g.sandwich_no_default_key_mappings = true
vim.g.operator_sandwich_no_default_key_mappings = true
vim.g.textobj_sandwich_no_default_key_mappings = true
vim.g.lion_create_maps = false
vim.g.tcomment_maps = false
