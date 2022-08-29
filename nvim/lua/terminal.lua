local M = {}
local last_cmd = ""

local function run_term()
    vim.cmd('FloatermNew --title=' .. last_cmd:gsub(" ", "\\ ") .. ' --width=0.9 --height=0.9 --autoclose=0 ' .. last_cmd)
end

function M.open()
    last_cmd = vim.fn.input("Command: ")
    run_term()
end

function M.open_last()
    run_term()
end

return M
