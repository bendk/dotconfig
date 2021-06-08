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

for i, char in pairs(map.LETTER_KEYCODES) do
    local register
    if char == 'c' then
	-- "c" -> clipboard
	register = '+'
    elseif char == 's' then
	-- "s" -> selection
	register = 's'
    else
	register = char
    end
    map.map('nx', 'xp' .. char, '"' .. register .. 'p')
    map.map('nx', 'xP' .. char, '"' .. register .. 'P')
    map.map('nx', 'xy' .. char, '"' .. register .. 'y')
end

-- TODO: registers

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
