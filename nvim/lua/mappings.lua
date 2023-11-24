local map = require('map')

-- Generic
map.map('', 'h', map.call_lua('help', 'show_window()'))
map.map('n', '<esc>', ':nohls<cr>')
map.map('n', '.', '<Plug>(operator-sandwich-predot)<Plug>(RepeatDot)')
--Hop
map.map('', 'j', map.command('HopChar1'))
map.map('', 'j<cr>', map.command('HopLine'))
-- z -> buffers
map.map('n', 'z', '<cmd>BufferPick<cr>')
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
map.map('n', 'ggp', map.command_lua('vim.diagnostic.goto_prev()'))
map.map('n', 'ggn', map.command_lua('vim.diagnostic.goto_next()'))
map.map('n', 'ggo', map.command_lua('vim.diagnostic.open_float()'))
map.map('n', 'gd', map.command_lua('vim.lsp.buf.definition()'))
map.map('n', 'gi', map.command_lua('vim.lsp.buf.implementation()'))
map.map('n', 'gr', map.command_lua('vim.lsp.buf.references()'))
map.map('n', 'gb', '<c-o>') -- Go back
map.map('n', 'gf', '<c-i>') -- Go forward
map.map('n', 'gm', '%') -- Go match
-- x -> "eXtra actions".  These are alternative versions of normal mode commands
map.map('', 'x', '<Nop>')
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
-- paste/yank/delete to/from clipboard/selection
map.multi_map('nx', {'p', 'P', 'y', 'd'}, 'x%s', '"+%s')
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
map.multi_map('', map.CHARACTER_KEYCODES, 'l%s', map.call_lua('find', 'to_forward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 'F%s', map.call_lua('find', 'find_backward([[%s]])'))
map.multi_map('', map.CHARACTER_KEYCODES, 'L%s', map.call_lua('find', 'to_backward([[%s]])'))
-- Make forward finding inclusive
map.multi_map('o', map.CHARACTER_KEYCODES, 'f%s', 'v' .. map.call_lua('find', 'find_forward([[%s]])'))
map.multi_map('o', map.CHARACTER_KEYCODES, 'l%s', 'v' .. map.call_lua('find', 'to_forward([[%s]])'))
-- Repeat last f/t
map.map('', ';', map.call_lua('find', 'repeat_find()'))
-- Leader
map.map('n', '<leader>d', '<cmd>edit ~/txt/todo<cr>')
map.map('n', '<leader>i', map.command_lua('require("commands").toggle_inlay_hints()'))
map.map('n', '<leader>r', '<cmd>DeleteTrailingWhitespace<cr><cmd>retab<cr>')
-- Visual leader
map.map('x', '<Leader>c', '<plug>TComment_gc')
-- Leader: Buffer
map.map('n', '<leader>bn', '<cmd>bn<cr>')
map.map('n', '<leader>bp', '<cmd>bp<cr>')
map.map('n', '<leader>bd', '<cmd>bd<cr>')
map.map('n', '<leader>bw', '<cmd>w<cr>')
-- Leader: Window
map.map('n', '<leader>wc', '<c-w>c')
map.map('n', '<leader>wo', '<c-w>o')
map.map('n', '<leader>w<down>', '<c-w><down>')
map.map('n', '<leader>w<up>', '<c-w><up>')
map.map('n', '<leader>w<left>', '<c-w><left>')
map.map('n', '<leader>w<right>', '<c-w><right>')
-- Leader: Telescope
map.map('n', '<leader>cf', '<cmd>Telescope find_files<cr>')
map.map('n', '<leader>cg', '<cmd>Telescope live_grep<cr>')
map.map('n', '<leader>cr', '<cmd>Telescope resume<cr>')
map.map('n', '<leader>cc', '<cmd>Telescope commands<cr>')
-- Leader: Comma
map.map('n', '<Leader>,p', '<plug>(swap-prev)')
map.map('n', '<Leader>,n', '<plug>(swap-next)')
map.map('nx', '<Leader>,i', '<plug>(swap-interactive)')
map.map('nx', '<Leader>,e', '<cmd>ArgWrap<cr>')
-- Leader: Spell
map.map('n', '<leader>st', '<cmd>set spell!<cr>')
map.map('n', '<leader>ss', 'z=')
map.map('n', '<leader>sa', 'zg')
map.map('n', '<leader>sr', 'zw')
-- Leader: Terminal
map.map('n', '<leader>to', '<cmd>lua require("terminal").open()<cr>')
map.map('n', '<leader>tt', '<cmd>lua require("terminal").open_last()<cr>')
-- Insert mode
map.map('i', '<c-h>', '<c-o><cmd>lua vim.lsp.buf.hover()<cr>')
-- Unmap keys that I don't want to use
map.map('', 'gg', '<nop>')
map.map('', 'G', '<nop>')
map.map('', 'Q', '<nop>')

-- Disable default plugin mappings
vim.g.swap_no_default_key_mappings = true
vim.g.sandwich_no_default_key_mappings = true
vim.g.operator_sandwich_no_default_key_mappings = true
vim.g.textobj_sandwich_no_default_key_mappings = true
vim.g.tcomment_maps = false
