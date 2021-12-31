local map = require('map')

require('rust-tools').setup {
    tools = {
        autoSetHints = false,
    }
}

map.map('n', '<leader>lb', '<cmd>make build<cr>')
map.map('n', '<leader>lc', '<cmd>make clippy<cr>')
map.map('n', '<leader>ll', '<cmd>make lint<cr>')
map.map('n', '<leader>lm', "<cmd>:lua require'rust-tools.expand_macro'.expand_macro()<cr>")
map.map('n', '<leader>lt', "<cmd>:RustTest<cr>")
