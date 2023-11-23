-- Statusline helpers
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

function lsp_status()
    local status = {}
    for token, progress in pairs(in_progress_lsp_tokens) do
        if progress ~= nil then

            table.insert(status,
                (progress.title or "unknown")
                .. " ("
                .. (progress.percentage or 0)
                .. "%%)"
            )
        end
    end
    if #status > 0 then
        return table.concat(status, " ")
    else
        return ""
    end
end

-- setup theme
require('night-owl').setup({italics=false})

-- setup status line
require('lualine').setup({
    options = {
        icons_enabled = false,
        component_separators = {left = '', right = '' },
        section_separators = {left = '', right = '' }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {lsp_status},
        lualine_y = {'encoding', 'filetype'},
        lualine_z = {'location'}
    }
})
