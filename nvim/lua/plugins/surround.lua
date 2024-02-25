return {
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "s",
                    normal_cur = "ss",
                    normal_line = "S",
                    normal_cur_line = "SS",
                    visual = "s",
                    visual_line = "s",
                    delete = "ds",
                    change = "cs",
                    change_line = "cS",
                },
                surrounds = {
                    -- "generic"
                    g = {
                        add = function()
                            local config = require("nvim-surround.config")
                            local result = config.get_input("Enter the generic name: ")
                            if result then
                                return { { result .. "<" }, { ">" } }
                            end
                        end,
                        find = function()
                            local config = require("nvim-surround.config")
                            return config.get_selection({ node = "generic_type" })
                        end,
                        delete = "^(.-<)().-(>)()$",
                        change = {
                            target = "^(.-<)().-(>)()$",
                            replacement = function()
                                local config = require("nvim-surround.config")
                                local result = config.get_input("Enter the generic name: ")
                                if result then
                                    return { { result .. "<" }, { ">" } }
                                end
                            end,
                        }
                    },
                },
                highlights = {
                    duration = 0,
                },
            })
        end
    }
}
