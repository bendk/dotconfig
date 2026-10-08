local M = {}

function M.open_current_date()
    vim.cmd(string.format("edit ~/notes/days/%s.md", os.date("%Y-%m-%d")))
end

return M

