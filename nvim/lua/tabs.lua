require("bufferline").setup {
    options = {
        numbers = function(opts)
            local hotkeys = "snthaoeu"
            if opts.ordinal <= 8 then
                return "[" .. string.sub(hotkeys, opts.ordinal, opts.ordinal) .. "]"
            else
                return ""
            end
        end,
        separator_style="slant",
        show_buffer_icons=false,
        show_buffer_close_icons=false,
        show_close_icons=false,
    },
}
