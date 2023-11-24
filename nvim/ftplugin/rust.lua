-- Rust is one of the languages where the spellcheck works well
vim.opt.spell = true

local map = require('map')

require('rust-tools').setup {
    tools = {
        inlay_hints = {
            auto = false,
        }
    }
}

map.map('n', ',lm', "<cmd>:lua require'rust-tools'.expand_macro.expand_macro()<cr>")
map.map('n', ',lt', "<cmd>:lua require'rust-tools'.open_cargo_toml.open_cargo_toml()<cr>")
