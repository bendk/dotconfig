local map = require('map')

map.map('', 'j', map.plug('(easymotion-bd-f)'))
map.map('', 'h', map.call_lua('help', 'show_window()'))
map.map('n', '<esc>', ':nohls<cr>')
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

-- To/find
map.multi_map('', map.CHARACTER_KEYCODES, 'f%s', map.call_lua('find', 'find_forward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 't%s', map.call_lua('find', 'to_forward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 'xf%s', map.call_lua('find', 'find_backward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 'xt%s', map.call_lua('find', 'to_backward([[%s]])'))
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

-- c comment
-- n names
-- f format
-- w swap

-- Unmap keys that I don't want to use
map.map('', 'gg', '<nop>')
map.map('', 'G', '<nop>')
map.map('', 'Q', '<nop>')


-- TODO
-- map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { silent=true})
-- map('n', 's', '<Plug>(easymotion-bd-f)', {noremap=false})
-- Mini word
-- Dotted name
