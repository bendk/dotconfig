return {
    "willothy/nvim-cokeline",
    dependencies="bendk/night-owl.nvim",
    config = function()
        local get_hl_attr = require('cokeline.hlgroups').get_hl_attr
        require('cokeline').setup({
            default_hl = {
                fg = function(buffer) return (buffer.is_focused) and "Title" or "StatusLine" end,
                bg = "StatusLine",
            },
            fill_hl = "StatusLine",
            components = {
                {
                    text = function(buffer)
                        return "[" .. buffer.pick_letter .. "] "
                    end,
                },
                {
                    text = function(buffer) return buffer.filename end,
                    bold = function(buffer) return buffer.is_focused end,
                },
                {
                    text = function(buffer) return buffer.is_last and "" or "   " end,
                },
            },
            pick = {
                use_filename = false,
                letters = "snthaoeuzvwm;qjk",
            },
        })
    end,
}
