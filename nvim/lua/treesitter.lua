-- Syntax highlighting using treesitter

require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    highlight = {
	enable = true,
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
