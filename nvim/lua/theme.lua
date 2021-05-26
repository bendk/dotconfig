opt('o', 'termguicolors', true)
vim.g.onedark_color_overrides = {
    black = { gui = "#111316", cterm = "235", cterm16 = "0" },
}
vim.cmd('colorscheme onedark')
vim.g.lightline = { colorscheme = 'onedark' }
