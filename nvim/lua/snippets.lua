local snippy = require("snippy")
snippy.setup({
    mappings = {
        is = {
            ["<C-n>"] = "expand_or_advance",
            ["<C-p>"] = "previous",
        },
    },
})
