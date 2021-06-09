-- Handle f/t
--
-- The only change from the default behavior is that this searches over multiple lines

local map = require('map')
local M = {}

local function escape_key(ch)
    if ch == '\\' then
	return '\\\\'
    else
	return ch
    end
end

local last_find = {}

local function do_find(pattern, mode)
    vim.fn.search('\\V' .. pattern, mode)
    last_find = { pattern, mode }
end

function M.repeat_find()
    if last_find then
	vim.fn.search(last_find[1], last_find[2])
    end
end

function M.find_forward(key)
    do_find(escape_key(key), 'W')
end

function M.find_backward(key)
    do_find(escape_key(key), 'bW')
end

function M.to_forward(key)
    do_find('\\.' .. escape_key(key), 'W')
end

function M.to_backward(key)
    do_find(escape_key(key) .. '\\.', 'beW')
end

return M
