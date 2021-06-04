-- Search handling

-- Make f search multiple lines

local M = {}

local function quote_char(ch)
    if ch == '\\' then
	return '\\\\'
    else
	return ch
    end
end

local function getchar()
    local char = vim.fn.getchar()
    if type(char) == "number" then
	return vim.fn.nr2char(char)
    else
	return nil
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


function M.find_forward()
    local char = getchar()
    if char then
	do_find('\\V' .. quote_char(char), '')
    end
end

function M.find_backward()
    local char = getchar()
    if char then
	do_find('\\V' .. quote_char(char), 'b')
    end
end

function M.to_forward()
    local char = getchar()
    if char then
	do_find('\\V\\.' .. quote_char(char), '')
    end
end

function M.to_backward()
    local char = getchar()
    if char then
	do_find('\\V' .. quote_char(char) .. '\\@<=\\.', 'b')
    end
end

return M
