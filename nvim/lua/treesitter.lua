-- Syntax highlighting using treesitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "lua", "rust", "toml", "python", "kotlin", "c", "cpp", "javascript", "typescript", "html", "css", "svelte" },
  callback = function()
    -- highlighting
    vim.treesitter.start()
    -- indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    -- better arg swap
    vim.keymap.set("n", "<leader>,p", function()
        require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.inner"
    end)
    vim.keymap.set("n", "<leader>,n", function()
        require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
    end)
  end,
})
