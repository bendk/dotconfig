-- vim settings

vim.opt.hidden = true

-- Command tab completion 
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full'
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.iskeyword:append("-")

-- rg for grep
vim.opt.grepprg='rg --vimgrep --no-heading'
vim.opt.grepformat='%f:%l:%c:%m,%f:%l:%m'

require'hop'.setup { keys = 'abcdefghijklmnopqrstuvwxyz', perm='TrieBacktrackFilling',}
