local function on_load()
    -- Restore the <enter> mapping, which we removed in unmap
    vim.api.nvim_buf_set_keymap(0, 'n', '<enter>', '<cmd>.cc<cr>', {noremap=true})
    -- Use a floating window
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    vim.api.nvim_win_set_config(0, {
	style = "minimal",
	relative = "editor",
	width = width,
	height = height,
	col = 0,
	row = 0,
    })
    -- Close the window when we leave the buffer (when an item is selected)
    vim.api.nvim_command('autocmd! WinLeave <buffer> :wincmd c')
end

vim.api.nvim_command('autocmd! FileType qf :lua require("changelist").on_load()')

return {
    on_load = on_load
}
