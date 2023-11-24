vim.g.mapleader = ","

require("mason").setup()
require("mason-lspconfig").setup()
require('utils');
require('commands');
require('settings');
require('theme');
require('find');
require('sandwich');
require('lsp');
require('treesitter');
require('telescope_setup');
require('snippets');
require('completion');
require('tabs');
require('dressing_setup');
require('signature');
require('mappings');
require('neovide');

-- Make sure repeat.vim is loaded
vim.cmd("runtime autoload/repeat.vim")
