-- Handle f/t
--
-- The only change from the default behavior is that this searches over multiple lines

local map = require('map')
local M = {}

local function escape_key(ch)
    if ch == '\\' then
	return '\\\\'
    elseif ch == '[cr]' then
	return '\\n'
    elseif ch == '[tab]' then
	return '\\t'
    else
	return ch
    end
end

local last_find = {}

local function do_find(pattern, mode)
    vim.fn.search(pattern, mode)
    last_find = { pattern, mode }
end

function M.repeat_find()
    if last_find then
	vim.fn.search(last_find[1], last_find[2])
    end
end

function M.find_forward(key)
    do_find('\\V' .. escape_key(key), '')
end

function M.find_backward(key)
    do_find('\\V' .. escape_key(key), 'b')
end

function M.to_forward(key)
    do_find('\\V\\.' .. escape_key(key), '')
end

function M.to_backward(key)
    do_find('\\V' .. escape_key(key) .. '\\@<=\\.', 'b')
end

-- Map all combinations of f<key>, t<key>, etc.

local function map_one_key(char, arg_value)
    map.map('', 'f' .. char, map.call_lua('find', 'find_forward("' .. arg_value .. '")'))
    map.map('', 't' .. char, map.call_lua('find', 'to_forward("' .. arg_value .. '")'))
    map.map('', 'F' .. char, map.call_lua('find', 'find_backward("' .. arg_value .. '")'))
    map.map('', 'T' .. char, map.call_lua('find', 'to_backward("' .. arg_value .. '")'))
    -- Make sure to make them inclusive for operator pending
    map.map('o', 'f' .. char, 'v' .. map.call_lua('find', 'find_forward("' .. arg_value .. '")'))
    map.map('o', 't' .. char, 'v' .. map.call_lua('find', 'to_forward("' .. arg_value .. '")'))
end

-- ascii printable chars (minus delete)
for num = 32,126 do
    -- Make sure to escape "<"
    local key = vim.fn.nr2char(num)
    local char = key
    if key == "<" then 
	char = "\\<"
    end
    map_one_key(key, char)
end

-- Special chars
map_one_key('<cr>', '[cr]')
map_one_key('<tab>', '[tab]')

return M
