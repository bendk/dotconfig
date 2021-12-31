require('telescope').setup{
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            vertical = {
                mirror = true,
                prompt_position = 'top',
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
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
        }
    }
}
require('telescope').load_extension('fzy_native')
