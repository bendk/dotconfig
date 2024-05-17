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
        config = function()
            vim.cmd('sign define LspDiagnosticsSignError text=! texthl=LspDiagnosticsSignError linehl= numhl=')
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = false,
                    signs = true,
                    underline = false,
                    update_in_insert = true
                }
            )
            require'lspconfig'.pyright.setup{}
            require'lspconfig'.rust_analyzer.setup{}
            require'lspconfig'.kotlin_language_server.setup{}
            require'lspconfig'.svelte.setup{}
            require'lspconfig'.tsserver.setup{}
        end,
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
}
