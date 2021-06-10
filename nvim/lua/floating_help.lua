-- Make quickfix and help use floating windows

local map = require('map')

local M = {}

local function make_window_floating()
    -- Use a floating window
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    vim.api.nvim_win_set_config(0, {
	style = "minimal",
	relative = "editor",
	width = width,
	height = height,
	col = 0,
	row = 0,
    })
    -- Close the window when we leave the buffer (for example an item is selected in quickfix)
    vim.api.nvim_command('autocmd! WinLeave <buffer> :wincmd c')
    -- Make q close the window
    map.buf_map(0, 'n', 'q', '<cmd>:q<cr>')
end

function M.on_buf_enter()
    if vim.opt.filetype:get() == "help" then
	make_window_floating()
    end
end

vim.api.nvim_exec([[
augroup quickfix
autocmd!
autocmd! BufEnter * :lua require("floating_help").on_buf_enter()
augroup END
]], false)

return M
