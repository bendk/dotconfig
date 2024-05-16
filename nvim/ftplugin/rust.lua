local map = require('map')

-- Rust is one of the languages where the spellcheck works well
vim.opt.spell = true
map.map('n', ',lm', "<cmd>:RustLsp expandMacro<cr>")
map.map('n', ',lt', "<cmd>:RustLsp openCargo<cr>")
