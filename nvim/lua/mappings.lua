local map = require('map')

-- Generic
map.map('', 'h', map.call_lua('help', 'show_window()'))
map.map('n', '<esc>', ':nohls<cr>')
-- Hop
map.map('', 'j', map.call_lua('hop', 'hint_char1()'))
map.map('', 'j<cr>', map.call_lua('hop', 'hint_lines_skip_whitespace()'))
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
-- Space switchers buffers
map.map('n', '<space>', map.call_lua('cokeline.mappings', 'pick("focus")'))
-- Leader
map.map('n', '<leader>z', '<cmd>DeleteTrailingWhitespace<cr><cmd>retab<cr>')
map.map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
map.map('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
map.map('nx', '<leader>mm', map.call_lua('markdown-list-tools', 'toggle_checkbox()'))
map.map('nx', '<leader>mt', map.call_lua('markdown-list-tools', 'toggle_checkbox_present()'))
-- Visual leader
map.map('x', '<Leader>c', '<plug>TComment_gc')
-- Leader: Documents
map.map('n', '<leader>dt', '<cmd>edit ~/notes/mozilla/todo.md<cr>')
map.map('n', '<leader>dl', '<cmd>edit ~/notes/mozilla/worklog.md<cr>')
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
map.map('n', '<leader>cn', map.call_lua('telescope.builtin', 'find_files { cwd = "~/notes" }'))
map.map('n', '<leader>cg', '<cmd>Telescope live_grep<cr>')
map.map('n', '<leader>cr', '<cmd>Telescope oldfiles cwd_only=true<cr>')
map.map('n', '<leader>cm', '<cmd>Telescope commands<cr>')
map.map('n', '<leader>cc', '<cmd>Telescope resume<cr>')
-- Leader: Comma
map.map('n', '<Leader>,p', '<plug>(swap-prev)')
map.map('n', '<Leader>,n', '<plug>(swap-next)')
map.map('nx', '<Leader>,i', '<plug>(swap-interactive)')
map.map('nx', '<Leader>,e', map.call_lua('treesj', 'toggle()'))
-- Leader: Spell
map.map('n', '<leader>st', '<cmd>set spell!<cr>')
map.map('n', '<leader>ss', 'z=')
map.map('n', '<leader>sa', 'zg')
map.map('n', '<leader>sr', 'zw')
-- Leader: Naming
map.map('', '<leader>nc', '<plug>(polyword-transform-camel)')
map.map('', '<leader>ns', '<plug>(polyword-transform-snake)')
map.map('', '<leader>nk', '<plug>(polyword-transform-kebab)')
map.map('', '<leader>nC', '<plug>(polyword-transform-pascal)')
map.map('', '<leader>nS', '<plug>(polyword-transform-snake-upper)')
map.map('', '<leader>nK', '<plug>(polyword-transform-kebab-upper)')
-- Leader: LSP
-- Note: some of these are setup in the ftplugin files
map.map('n', '<leader>li', map.command_lua('vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())'))

-- Leader: Terminal
map.map('n', '<leader>to', '<cmd>lua require("terminal").open()<cr>')
map.map('n', '<leader>tt', '<cmd>lua require("terminal").open_last()<cr>')
-- Insert mode
map.map('i', '<c-w>', '<cr><tab><cr><up><c-o>$')
map.map('i', '<c-s>', map.call_lua('tags', 'close_tag()'))
-- repeate last tag
-- fix this
map.map('i', '<c-h>', map.call_lua('tags', 'move_to_tag_end()'))
map.map('n', '<c-h>', map.call_lua('tags', 'move_to_tag_end()'))
-- c-n and c-p navigate snippets, with no fallback to the default bindings
vim.keymap.set('i', '<c-n>', function()
    local snippy = require('snippy')
    if snippy.can_jump(1) then
        snippy.next()
    end
end)
vim.keymap.set('i', '<c-p>', function()
    local snippy = require('snippy')
    if snippy.can_jump(-1) then
        snippy.previous()
    end
end)

-- Unmap keys that I don't want to use
map.map('', 'gg', '<nop>')
map.map('', 'G', '<nop>')
map.map('', 'Q', '<nop>')
map.map('n', '<c-n>', '<nop>')
map.map('n', '<c-p>', '<nop>')

-- Disable default plugin mappings
vim.g.swap_no_default_key_mappings = true
vim.g.sandwich_no_default_key_mappings = true
vim.g.operator_sandwich_no_default_key_mappings = true
vim.g.textobj_sandwich_no_default_key_mappings = true
vim.g.tcomment_maps = false
