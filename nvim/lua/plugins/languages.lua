return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
        end,
    },
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
    },
    "nvim-treesitter/nvim-treesitter",
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup {
                floating_window_above_cur_line = true
            }
        end,
    },
    {
        'vxpm/ferris.nvim',
        opts = {
            create_commands = false
        }
    },
    "udalov/kotlin-vim",
    {
        "bendk/markdown-list-tools",
        ft = "markdown",
        config = function()
            require("markdown-list-tools").setup()
        end
    },
    {
      "benomahony/uv.nvim",
      opts = {
        picker_integration = true,
      },
    }
}
