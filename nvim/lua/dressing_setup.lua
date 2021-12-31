require('dressing').setup({
  input = { 
      winblend = 0,
      winhighlight = "Normal:Normal",
  },
  select = {
    backend = { "telescope" },
    telescope = {
      theme = "cursor",
    },
  },
})
vim.cmd('hi link DressingInputText Normal')
