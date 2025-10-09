local map = require('map')

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            cachePriming = {
                enable = false
            },
        }
    }
})

-- Rust is one of the languages where the spellcheck works well
vim.opt.spell = true
map.map('n', ',lm', map.command_lua('require("ferris.methods.expand_macro")()'))
map.map('n', ',lt', map.command_lua('require("ferris.methods.open_cargo_toml")()'))
