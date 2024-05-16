return {
    "willothy/nvim-cokeline",
    dependencies="oxfist/night-owl.nvim",
    config = function()
        local get_hl_attr = require('cokeline.hlgroups').get_hl_attr
        require('cokeline').setup({
            default_hl = {
                fg = function(buffer) return (buffer.is_focused) and "Title" or "Normal" end,
                bg = "Normal",
            },
            fill_hl = "Normal",
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
