-- My little help window

local map = require('map')

local HELP_TEXT = {
    -- Format:
    --
    {
	-- Header:
	{"Goto"},
	-- Lines:
	{"gh", "First line"},
	{"ge", "Last line"},
	{"gl", "Line"},
	{"gt", "Search for token"},
	{"gp", "Quickfix prev"},
	{"gn", "Quickfix next"},
	{"gfp", "Quickfix file-prev"},
	{"gfn", "Quickfix file-next"},
	{"gcc", "Quickfix current"},
	{"gco", "Quickfix show"},
	{"gjp", "Jumplist prev"},
	{"gjn", "Jumplist next"},
    },
    {
	{"Paste/Yank/Delete..."},
	{"xp", "Paste"},
	{"xP", "Paste before"},
	{"xy", "Yank"},
	{"xd", "Delete"},
	{"...Destination"},
	{"c", "Clipboard"},
	{"s", "Selection"},
	{"[other]", "Register"},
    },
    {
	{"Miniword"},
	{"xw", "Next miniWord"},
	{"xb", "Back mini_word"},
	{"im", "inner miniword"},
	{"am", "a miniword"},
	{"Megaword"},
	{"W", "Next mega.word"},
	{"B", "Back mega:word"},
	{"iW", "inner megaword"},
	{"aW", "a megaword"},
    },
    {
	{"Transforms"},
	{"xa[char]", "Align items"},
	{"xc", "Toggle comments"},
	{"xn[char]", "Change naming style"},
	{"Comma list"},
	{"x,n", "Swap next"},
	{"x,p", "Swap prev"},
	{"x,i", "Swap interactive"},
	{"x,e", "Toggle expanded"},
    },
    {
	{"Surround"},
	{"s[motion]", "Add Surround"},
	{"ds", "Delete Surround"},
	{"dss", "Delete Surround (auto-select)"},
	{"cs", "Change Surround"},
	{"css", "Change Surround (auto-select)"},
	{"Special Surround"},
	{"f", "function(___)"},
	{"g", "generic<___>"},
	{"i", "Instant (any two strings)"},
    },
    {
	{"Swap interactive mode"},
	{"<down>", "Next item"},
	{"<up>", "Prev item"},
	{"<right>", "Swap with next"},
	{"<left>", "Swap with prev"},
	{"s", "Sort"},
	{"r", "Reverse"},
	{"g", "Group item"},
    }
};

local HELP_TEXT_COLUMN_WIDTH = 30

local M = {}

local function calc_column_info(columns)
    local sizes = {}
    local info = {
	max_key_lengths = {}
    }
    for _, column in pairs(columns) do
	table.insert(sizes, table.maxn(column))
	local max_key_len = 0
	for _, cell in pairs(column) do
	    if cell[2] then
		max_key_len = math.max(max_key_len, #cell[1])
	    end
	end
	table.insert(info.max_key_lengths, max_key_len)
    end
    info.max_size = math.max(unpack(sizes))
    return info
end

local function format_cell(key, label, max_key_len)
    local line
    if key then
	-- pad key
	line = key .. ':' .. string.rep(' ', max_key_len - #key + 1) .. label
    else
	line = label
    end
    return line .. string.rep(' ', HELP_TEXT_COLUMN_WIDTH - #line)
end

local function set_buf_row(buf, start_row, columns)
    local column_info = calc_column_info(columns)
    local lines = {}
    local header_areas = {}

    for row = 1, column_info.max_size do
	local line = ""
	for column_index, col in pairs(columns) do
	    local cell = col[row]
	    if cell == nil then
		-- Past the end of the column
		line = line .. string.rep(' ', HELP_TEXT_COLUMN_WIDTH)
	    elseif cell[2] == nil then
		-- Header cell
		table.insert(header_areas, {start_row + row - 1, #line, #line + #cell[1]})
		line = line .. format_cell(nil, cell[1], column_info.max_key_lengths[column_index])
	    else
		-- Key: label cell
		line = line .. format_cell(cell[1], cell[2], column_info.max_key_lengths[column_index])
	    end
	end
	table.insert(lines, line)
    end
    vim.api.nvim_buf_set_lines(buf, start_row, start_row, false, lines)

    for i, area in pairs(header_areas) do 
	vim.api.nvim_buf_add_highlight(buf, -1, "Function", area[1], area[2], area[3])
    end

    return column_info.max_size
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


    map.buf_map(buf, '', 'h', ':q<cr>', {nowait=true})
    map.buf_map(buf, '', 'q', ':q<cr>', {nowait=true})
    map.buf_map(buf, '', '<esc>', ':q<cr>', {nowait=true})
    map.buf_map(buf, '', '<enter>', ':q<cr>', {nowait=true})
    vim.api.nvim_command('autocmd WinLeave <buffer> quit')
end

return M
