local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
        "vim-scripts/DeleteTrailingWhitespace",
        "folke/flash.nvim",
        "machakann/vim-sandwich",
        "machakann/vim-swap",
        "FooSoft/vim-argwrap",
        "tomtom/tcomment_vim",
        {
            "bendk/polyword.vim"
            -- dir = "../../src/polyword.vim"
        },
        -- LSP/Treesitter
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
        "ray-x/lsp_signature.nvim",
        -- Completion / Snippets
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "dcampos/cmp-snippy",
        "dcampos/nvim-snippy",
        -- UI
        "bendk/night-owl.nvim", -- color scheme
        "nvim-lualine/lualine.nvim", -- statusline
        "stevearc/dressing.nvim", -- UI helper
        "PeterRincker/vim-searchlight", -- search result highlight
        -- Telescope
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "BurntSushi/ripgrep",
        -- Language-specific
        "rust-lang/rust.vim",
        "simrat39/rust-tools.nvim",
        "udalov/kotlin-vim",
        -- Terminal
        "voldikss/vim-floaterm",
        -- Tabs
        "nvim-tree/nvim-web-devicons",
        "akinsho/bufferline.nvim",
})

vim.g.mapleader = ","

require("mason").setup()
require("mason-lspconfig").setup()
require('utils')
require('commands')
require('settings')
require('theme')
require('find')
require('sandwich')
require('lsp')
require('treesitter')
require('telescope_setup')
require('snippets')
require('completion')
require('tabs')
require('dressing_setup')
require('signature')
require('mappings')
require('neovide')
