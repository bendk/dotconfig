-- Stop search highlighting on cursor move
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.api.nvim_command('autocmd CursorMoved * :nohlsearch')
