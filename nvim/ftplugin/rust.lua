local map = require('map')

require('rust-tools').setup {
    tools = {
        inlay_hints = {
            auto = false,
        }
    }
}

map.map('n', 'xm', "<cmd>:lua require'rust-tools'.expand_macro.expand_macro()<cr>")
map.map('n', 'xt', "<cmd>RustOpenCargo<cr>")
map.map('n', 'xid', "<cmd>RustMoveItemDown<cr>")
map.map('n', 'xiu', "<cmd>RustMoveItemUp<cr>")
