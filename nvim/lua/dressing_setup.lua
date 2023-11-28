require('dressing').setup({
  input = {
      insert_only = false,
      start_in_insert = false,
      win_options = {
          winblend = 0,
          winhighlight = "Normal:Normal",
      },
  },
  select = {
    backend = { "telescope" },
    telescope = require('telescope.themes').get_cursor(),
  },
})
vim.cmd('hi link DressingInputText Normal')
