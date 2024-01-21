-- Syntax highlighting using treesitter

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "rust", "toml", "python", "kotlin", "c", "cpp", "javascript", "typescript", "html", "css", "svelte" },
    highlight = {
	enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting=false,
    },
    indent = {
	enable = true
    },
    textobjects = {
	select = {
	    enable = true,
	    keymaps = {
		["af"] = "@function.outer",
		["if"] = "@function.inner",
		["ac"] = "@class.outer",
		["ic"] = "@class.inner",
	    }
	},
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
	swap = {
	    enable = true,
	    swap_next = {
		["<leader>a"] = "@parameter.inner",
	    },
	    swap_previous = {
		["<leader>A"] = "@parameter.inner",
	    },
	},
    },
}
