opt('o', 'signcolumn', 'yes')
vim.cmd('sign define LspDiagnosticsSignError text=! texthl=LspDiagnosticsSignError linehl= numhl=')

if pcall(require, 'lspconfig') and pcall(require, 'completion') then
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	    virtual_text = false,
	    signs = true,
	    underline = true,
	    update_in_insert = false
	}
    )
    require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
    require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
end
