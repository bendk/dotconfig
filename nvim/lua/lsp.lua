opt('o', 'signcolumn', 'yes')
vim.cmd('sign define LspDiagnosticsSignError text=! texthl=LspDiagnosticsSignError linehl= numhl=')

if pcall(require, 'lspconfig') then
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
end
