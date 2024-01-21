return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                    ['<down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c', }),
                    ['<up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c', }),
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<C-n>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ['<C-t>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                },
                snippet = {
                    expand = function(args)
                        require('snippy').expand_snippet(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'snippy' }
                }, {
                    { name = 'buffer' },
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                }
            })
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig').pyright.setup { capabilities = capabilities }
            require('lspconfig').rust_analyzer.setup { capabilities = capabilities }
            require('lspconfig').kotlin_language_server.setup { capabilities = capabilities }
        end,
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "dcampos/cmp-snippy",
    {
        "dcampos/nvim-snippy",
        config = function() 
            local snippy = require("snippy")
            map = require('map')
            map.map('i', '<c-p>', '<nop>')
            map.map('i', '<c-n>', '<nop>')
            snippy.setup({
                mappings = {
                    is = {
                        ["<C-n>"] = "next",
                        ["<C-p>"] = "previous",
                    },
                },
            })
        end,
    },
}

