local wk = require('which-key')

-- map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { silent=true})
-- map('n', 's', '<Plug>(easymotion-bd-f)', {noremap=false})

-- Shortcuts to create bindings
local function command(line)
    return '<cmd>' .. line .. '<cr>'
end

local function call(call)
    return command('call ' .. call)
end

local function call_lua(module, call)
    return command('lua require("' .. module .. '").' .. call)
end

local function plug(keys)
    return '<Plug>' .. keys
end


local motions = {
    h = { 'h', 'Left' },
    t = { 'k', 'Down' },
    n = { 'j', 'Up' },
    s = { 'l', 'Right' },

    j = { plug('(easymotion-bd-f)'), 'Jump'},

    w = 'Next word',
    b = 'Previous word',
    e = 'Next end of word',
    -- Mini word
    -- Dotted name

    ['^'] = 'Start of line',
    ['$'] = 'End of line',
    f = { call_lua('search', 'find_forward()'), 'Move to next char' },
    F = { call_lua('search', 'find_backward()'), 'Move to previous char' },
    t = { call_lua('search', 'to_forward()'), 'Move before next char' },
    T = { call_lua('search', 'to_backward()'), 'Move before previous char' },
    [';'] = { call_lua('search', 'repeat_find()'), 'Repeat last Move' },

    ['/'] = 'Search forward',
    ['?'] = 'Search backward',
    ['<space>'] = { 'n', 'Next search match' },
    ['<bs>'] = { 'N', 'Previous search match' },
    ['<esc>'] = { ':nohls<cr>', 'Clear search'},

    g = {
	name = 'goto',
	h = { 'gg', 'First line' }, 
	e = { 'G', 'Last line' }, 
	l = { call('feedkeys(":")'), 'Line' }, 
	t = { '*', 'Token' }, 
	p = { command('cp'), 'Quickfix prev' },
	n = { command('cn'), 'Quickfix next' },
	fp = { command('cpf'), 'Quickfix file-prev' },
	fn = { command('cnf'), 'Quickfix file-next' },
	cc = { command('cc'), 'Quickfix current' },
	co = { command('copen'), 'Quickfix show' },
	jp = { '<c-o>', 'Jumplist prev' },
	jn = { '<c-i>', 'Jumplist next' },
    },
    ZZ = { 'ZZ', 'Save and Quit' },
}

local operators = {
    d = 'Delete',
    c = 'Change',
    y = 'Yank',
    v = 'Visual Character Mode',
    x = {
	name = 'eXtra Actions',
	-- c comment
	-- n names
	-- f format
	-- w swap
    },
}

local commands = {
    u = 'Undo',
    U = { '<C-r>', 'Redo' },
    ['<<'] = { '<<', 'Indent left', },
    ['>>'] = { '>>', 'Indent right' },
    [':'] = 'Command Line',
    [','] = {
	name = 'Menu',
	-- buffer
	-- window
	[','] = { command('WhichKey'), 'Which key menu' },
    },
}

local text_objects = {
    a = { name = 'around' },
    i = { name = 'inside' },
    ['a"'] = [[double quoted string]],
    ['a"'] = [[single quoted string]],
    ['a('] = [[same as ab]],
    ['a)'] = [[same as ab]],
    ['a<lt>'] = [[a <> from '<' to the matching '>']],
    ['a>'] = [[same as a<]],
    ['aB'] = [[a Block from [{ to ]} (with brackets)]],
    ['aW'] = [[a WORD (with white space)]],
    ['a['] = [[a [] from '[' to the matching ']']],
    ['a]'] = [[same as a[]],
    ['a`'] = [[string in backticks]],
    ['ab'] = [[a block from [( to ]) (with braces)]],
    ['ap'] = [[a paragraph (with white space)]],
    ['as'] = [[a sentence (with white space)]],
    ['at'] = [[a tag block (with white space)]],
    ['aw'] = [[a word (with white space)]],
    ['a{'] = [[same as aB]],
    ['a}'] = [[same as aB]],
    ['i"'] = [[double quoted string without the quotes]],
    ['i)'] = [[same as ib]],
    ['i<lt>'] = [[inner <> from '<' to the matching '>']],
    ['i>'] = [[same as i<]],
    ['iB'] = [[inner Block from [{ and ]}]],
    ['iW'] = [[inner WORD]],
    ['i['] = [[inner [] from '[' to the matching ']']],
    ['i]'] = [[same as i[]],
    ['i`'] = [[string in backticks without the backticks]],
    ['ib'] = [[inner block from [( to ])]],
    ['ip'] = [[inner paragraph]],
    ['is'] = [[inner sentence]],
    ['it'] = [[inner tag block]],
    ['iw'] = [[inner word]],
    ['i{'] = [[same as iB]],
    ['i}'] = [[same as iB]],
}

local visual_selectors = {
}

  -- Motions
wk.register(motions, { mode = "n", prefix = "" })
wk.register(motions, { mode = "o", prefix = "" })
wk.register(motions, { mode = "x", prefix = "" })
wk.register(commands, { mode = "n", prefix = "" })
wk.register(text_objects, { mode = "o", prefix = "" })
wk.register(visual_selectors, { mode = "x", prefix = "" })

wk.setup {
    plugins = {
	marks = true,
	registers = true,
	presets = false,
    },
    key_labels = {
	["<SPACE>"] = "SPACE",
	["<CR>"] = "ENTER",
	["<TAB>"] = "TAB",
    },
    operators = operators,
    ignore_missing = true,
} 
