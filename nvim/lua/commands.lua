-- Global functions

local M = {}
local inlay_hints = false

function M.toggle_inlay_hints()
    if inlay_hints then
        require('rust-tools').inlay_hints.unset()
        inlay_hints = false
    else
        require('rust-tools').inlay_hints.set()
        inlay_hints = true
    end
end

return M
