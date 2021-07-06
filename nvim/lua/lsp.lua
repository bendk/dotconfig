opt('o', 'signcolumn', 'yes')
vim.cmd('sign define LspDiagnosticsSignError text=! texthl=LspDiagnosticsSignError linehl= numhl=')

if pcall(require, 'lspconfig') then
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	    virtual_text = false,
	    signs = true,
	    underline = true,
	    update_in_insert = false
	}
    )
end
