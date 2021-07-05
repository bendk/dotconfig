opt('o', 'termguicolors', true)
vim.g.onedark_color_overrides = {
    black = { gui = "#111316", cterm = "235", cterm16 = "0" },
}

-- Statusline
local in_progress_lsp_tokens = {}
local function progress_callback(_, _, msg, client_id)
    if msg and msg.value and msg.value.kind then
	local kind = msg.value.kind
	if kind == 'begin' then
	    in_progress_lsp_tokens[msg.token] = true
	elseif kind == 'end' then
	    in_progress_lsp_tokens[msg.token] = nil
	end
        vim.cmd('redrawstatus!')
    end
end
vim.lsp.handlers['$/progress'] = progress_callback

function lsp_ready()
    for token, in_progress in pairs(in_progress_lsp_tokens) do
	if in_progress then return false end
    end
    return true
end

function _G.lsp_status()
    if lsp_ready() then
	return "LSP"
    else
	local tick = os.time() % 3
	if tick == 0 then
	    return "-  "
	elseif tick == 1 then
	    return " - "
	else
	    return "  -"
	end
    end
end

vim.cmd('colorscheme onedark')
vim.cmd([[
function! LSPStatus()
    return v:lua.lsp_status()
endfunction

let g:lightline = { 'enable': { 'statusline': 1, 'tabline': 0}, 'colorscheme': 'onedark', 'active': { 'right': [ [ 'lineinfo' ], [ 'percent' ], ['lsp_status'] ] }, 'component_function': { 'lsp_status': 'LSPStatus' }, }
]])
