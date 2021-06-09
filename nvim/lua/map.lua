-- map
-- 
-- Some utility functions for mapping keys

local M = {}

-- functions to make the rhs of mappings
function M.command(line)
    return '<cmd>' .. line .. '<cr>'
end

function M.call(call)
    return M.command('call ' .. call)
end

function M.call_lua(module, call)
    return M.command('lua require("' .. module .. '").' .. call)
end

function M.plug(keys)
    return '<Plug>' .. keys
end

local function get_options(opts, rhs)
    local rhs_has_plug = (string.find(string.lower(rhs), "<plug>") ~= nil)
    local options = {
	noremap = not rhs_has_plug,
	silent = true,
    }
    if opts then options = vim.tbl_extend('force', options, opts) end
    return options
end

function M.map(mode, lhs, rhs, opts)
    local options = get_options(opts, rhs)
    if mode == 'nx' then
	vim.api.nvim_set_keymap('n', lhs, rhs, options)
	vim.api.nvim_set_keymap('x', lhs, rhs, options)
    else
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

function M.buf_map(buf, mode, lhs, rhs, opts)
    local options = get_options(opts, rhs)
    if mode == 'nx' then
	vim.api.nvim_buf_set_keymap(buf, 'n', lhs, rhs, options)
	vim.api.nvim_buf_set_keymap(buf, 'x', lhs, rhs, options)
    else
	vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
    end
end

-- Support for mapping all characters of a particular type

M.CHARACTER_KEYCODES = {}
M.NON_LETTER_KEYCODES = {}
M.UPPERCASE_KEYCODES = {}
M.LOWERCASE_KEYCODES = {}
M.LETTER_KEYCODES = {}
for num = 32,126 do -- ASCII printable minus deleted
    local char = string.char(num)
    local is_lower = 'a' <= char and char <= 'z'
    local is_upper = 'A' <= char and char <= 'Z'
    if char == "<" then 
	char = "<lt>"
    end

    table.insert(M.CHARACTER_KEYCODES, char)
    if is_lower then table.insert(M.LOWERCASE_KEYCODES, char) end
    if is_upper then table.insert(M.UPPERCASE_KEYCODES, char) end
    if is_lower or is_upper then
	table.insert(M.LETTER_KEYCODES, char)
    else
	table.insert(M.NON_LETTER_KEYCODES, char)
    end
end

function M.multi_map(mode, keycodes, lhs_template, rhs_template, opts)
    for i, keycode in pairs(keycodes) do
	local argument = string.gsub(keycode, '<', '<lt>')
	M.map(mode, string.format(lhs_template, keycode), string.format(rhs_template, argument), opts)
    end
end

return M
