return {
    {
        -- color scheme
        "oxfist/night-owl.nvim",
        priority=1000,
        config = function()
            require("night-owl").setup({
                italics=false,
            })
            vim.cmd("colorscheme night-owl")
        end
    },
    "nvim-lualine/lualine.nvim", -- statusline
    {
        -- UI helper
        "stevearc/dressing.nvim",
        config = function()
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
        end,
    },
    "PeterRincker/vim-searchlight", -- search result highlight
    "voldikss/vim-floaterm",
}
