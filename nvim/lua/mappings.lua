local map = require('map')
local wk = require('which-key')

-- TODO
-- map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { silent=true})
-- map('n', 's', '<Plug>(easymotion-bd-f)', {noremap=false})

local motions = {
    j = { map.plug('(easymotion-bd-f)'), 'Jump'},

    w = 'Next word',
    b = 'Previous word',
    e = 'Next end of word',
    -- Mini word
    -- Dotted name

    ['^'] = 'Start of line',
    ['$'] = 'End of line',

    -- Find single chars
    f = 'Move forward to char',
    F = 'Move backward to char',
    t = 'Move forward to before char',
    T = 'Move backword to before char',
    [';'] = { map.call_lua('find', 'repeat_find()'), 'Repeat last Move' },
    -- Search for strings
    ['/'] = 'Search forward',
    ['?'] = 'Search backward',
    n = 'Next search match',
    N = 'Previous search match',
    ['<esc>'] = { ':nohls<cr>', 'Clear search'},
    g = {
	name = 'goto',
	h = { 'gg', 'First line' }, 
	e = { 'G', 'Last line' }, 
	l = { map.call('feedkeys(":")'), 'Line' }, 
	t = { '*', 'Token' }, 
	p = { map.command('cp'), 'Quickfix prev' },
	n = { map.command('cn'), 'Quickfix next' },
	fp = { map.command('cpf'), 'Quickfix file-prev' },
	fn = { map.command('cnf'), 'Quickfix file-next' },
	cc = { map.command('cc'), 'Quickfix current' },
	co = { map.command('copen'), 'Quickfix show' },
	jp = { '<c-o>', 'Jumplist prev' },
	jn = { '<c-i>', 'Jumplist next' },
    },
    ZZ = { 'Save and Quit' },
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
	[','] = { map.command('WhichKey'), 'Which key menu' },
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
