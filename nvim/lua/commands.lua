-- Global functions

local M = {}

function M.show_change_list()
    local buf_count = vim.fn.bufnr('$')
    for buf = 1,buf_count,1
    do
	print("buf: " .. buf .. " type: " .. vim.api.nvim_buf_get_option(buf, "buftype"))
    end
end

return M
