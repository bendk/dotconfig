local M = {}

function M.open_today()
    vim.cmd(string.format(
        "edit ~/notes/days/%s.md",
        os.date("%Y-%m-%d")
    ))
end

function M.open_yesterday()
    vim.cmd(string.format(
        "edit ~/notes/days/%s.md",
        os.date("%Y-%m-%d", os.time() - 86400)
    ))
end


return M

