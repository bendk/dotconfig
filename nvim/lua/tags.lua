local utils = require("nvim-treesitter.ts_utils")
local M = {}

function M.move_to_tag_end()
    local node = utils.get_node_at_cursor()
    if node == nil then
        return
    elseif node:type() ~= "element" then
        node = node:parent()
    end
    local row, col = node:end_()
    vim.api.nvim_win_set_cursor(0, {row + 1, col})
end

return M
