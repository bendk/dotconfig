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
                    update_in_insert = false
                }
            )
            require'lspconfig'.pyright.setup{}
            require'lspconfig'.rust_analyzer.setup{}
            require'lspconfig'.kotlin_language_server.setup{}
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
    "rust-lang/rust.vim",
    "simrat39/rust-tools.nvim",
    "udalov/kotlin-vim",
}
