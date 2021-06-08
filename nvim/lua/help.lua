-- My little help window

local map = require('map')

local HELP_TEXT = {
    -- Format:
    --
    {
	-- Header:
	{"g:  Goto"},
	-- Lines:
	"h:  First line",
	"e:  Last line",
	"l:  Line",
	"t:  Search for token",
	"p:  Quickfix prev",
	"n:  Quickfix next",
	"fp: Quickfix file-prev",
	"fn: Quickfix file-next",
	"cc: Quickfix current",
	"co: Quickfix show",
	"jp: Jumplist prev",
	"jn: Jumplist next",
    },
    {
	{"Paste/Yank..."},
	"xp: Paste...",
	"xP: Paste before...",
	"xy: Yank...",
	"",
	{"Destination"},
	"c:       Clipboard",
	"s:       Selection",
	"[other]: Register",
    },
};

local HELP_TEXT_COLUMN_WIDTH = 30

local M = {}

local function set_buf_row(buf, row, columns)
    local sizes = {}
    for i, col in pairs(columns) do
	table.insert(sizes, table.maxn(col))
    end

    local max_size = math.max(unpack(sizes))
    local lines = {}
    local headers = {}

    for i = 1, max_size do
	local line = ""
	for _, col in pairs(columns) do
	    local cell = col[i]
	    if type(cell) == "table" then
		-- Highlight
		cell = cell[1]
		local current_col = string.len(line)
		table.insert(headers, {row + i - 1, current_col, current_col + string.len(cell)})
	    end
	    if cell == nil then
		line = line ..  string.rep(" ", HELP_TEXT_COLUMN_WIDTH)
	    else
		line = line .. cell .. string.rep(" ", HELP_TEXT_COLUMN_WIDTH - string.len(cell))
	    end
	end
	table.insert(lines, line)
    end
    vim.api.nvim_buf_set_lines(buf, row, row, false, lines)

    for i, area in pairs(headers) do 
	vim.api.nvim_buf_add_highlight(buf, -1, "Function", area[1], area[2], area[3])
    end


    return max_size
end

local function set_buf_text(buf, width)
    local columns_per_row = math.floor(width / HELP_TEXT_COLUMN_WIDTH)
    local row = 0
    local columns = {}
    for i, col_text in pairs(HELP_TEXT) do
	table.insert(columns, col_text)
	if table.maxn(columns) >= columns_per_row then
	    local row_height = set_buf_row(buf, row, columns)
	    row = row + row_height + 1
	    columns = {}
	end
    end
    if next(columns) then
	set_buf_row(buf, row, columns)
    end
end

function M.show_window()
    local buf, win
    buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    local width = vim.o.columns
    local height = vim.o.lines
    local opts = {
	style = "minimal",
	relative = "editor",
	width = math.ceil(width * 0.8),
	height = math.ceil(height * 0.8),
	row = math.floor(height * 0.1),
	col = math.floor(width * 0.1),
    }
    win = vim.api.nvim_open_win(buf, true, opts)
    set_buf_text(buf, opts.width)


    map.buf_map(buf, '', 'q', ':q<cr>', {nowait=true})
    map.buf_map(buf, '', '<esc>', ':q<cr>', {nowait=true})
    map.buf_map(buf, '', '<enter>', ':q<cr>', {nowait=true})
    vim.api.nvim_command('autocmd WinLeave <buffer> quit')
end

return M
