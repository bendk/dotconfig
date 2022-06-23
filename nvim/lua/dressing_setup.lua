require('dressing').setup({
  input = { 
      winblend = 0,
      winhighlight = "Normal:Normal",
  },
  select = {
    backend = { "telescope" },
    telescope = require('telescope.themes').get_cursor(),
  },
})
vim.cmd('hi link DressingInputText Normal')
