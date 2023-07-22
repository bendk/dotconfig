require('telescope').setup{
    defaults = {
        dynamic_preview_title=true,
        sorting_strategy='ascending',
        layout_strategy = 'vertical',
        layout_config = {
            prompt_position = "top",
            vertical = {
                preview_height = 10,
                width = 0.98
            }
        },
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<C-q>"] = require("telescope.actions").send_to_qflist,
                ["<Esc>"] = require('telescope.actions').close,
            }
        },
    },
    pickers = {
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
        },
    }
}
