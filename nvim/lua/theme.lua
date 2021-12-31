opt('o', 'termguicolors', true)
vim.g.onedark_color_overrides = {
    black = { gui = "#111316", cterm = "235", cterm16 = "0" },
    background = { gui = "#111316", cterm = "235", cterm16 = "0" },
}

-- Statusline
local in_progress_lsp_tokens = {}
local function progress_callback(_, msg, client_id)
    if msg and msg.value and msg.value.kind then
        local value = msg.value
        if value.kind == 'end' then
            in_progress_lsp_tokens[msg.token] = nil
        else
            local progress = in_progress_lsp_tokens[msg.token] or {}
            if value.title then progress.title = value.title end
            if value.message then progress.message = value.message end
            if value.percentage then progress.percentage = value.percentage end
            in_progress_lsp_tokens[msg.token] = progress
        end
    end
    vim.cmd('redrawstatus!')
end
vim.lsp.handlers['$/progress'] = progress_callback

function _G.lsp_status()
    local status = {}
    for token, progress in pairs(in_progress_lsp_tokens) do
        if progress ~= nil then

            table.insert(status,
                (progress.title or "unknown")
                .. " ("
                .. (progress.percentage or 0)
                .. "%)"
            )
        end
    end
    if #status > 0 then
        return table.concat(status, " ")
    else
        return ""
    end
end

vim.cmd('colorscheme onedark')
vim.cmd([[
function! LSPStatus()
    return v:lua.lsp_status()
endfunction

let g:lightline = { 'enable': { 'statusline': 1, 'tabline': 0}, 'colorscheme': 'onedark', 'active': { 'right': [ [ 'lineinfo' ], [ 'line' ], ['lsp_status'] ] }, 'component': {'line': '%l/%L', }, 'component_function': { 'lsp_status': 'LSPStatus' }, }
]])

vim.cmd('hi link Searchlight Diffadd')
vim.cmd('hi link FloatBorder Normal')
