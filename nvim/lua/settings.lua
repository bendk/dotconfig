-- vim settings
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.foldenable = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.mouse = ""
vim.opt.helpheight=99999

-- Command tab completion 
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full'
vim.opt.shiftwidth = 4
vim.opt.textwidth = 100
vim.opt.showmode = false
vim.opt.iskeyword:append("-")

-- rg for grep
vim.opt.grepprg='rg --vimgrep --no-heading'
vim.opt.grepformat='%f:%l:%c:%m,%f:%l:%m'

-- Trailing spaces
vim.opt.list = true
vim.opt.listchars = 'tab:>-,trail:-'
