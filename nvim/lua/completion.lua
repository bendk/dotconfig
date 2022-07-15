local cmp = require'cmp'

cmp.setup({
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c', }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c', }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<C-t>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' }
    }, {
        { name = 'buffer' },
    })
})


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').pyright.setup { capabilities = capabilities }
require('lspconfig').rust_analyzer.setup { capabilities = capabilities }
require('lspconfig').kotlin_language_server.setup { capabilities = capabilities }
