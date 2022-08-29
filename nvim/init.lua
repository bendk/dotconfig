vim.g.mapleader = ","

require("mason").setup()
require("mason-lspconfig").setup()
require('utils');
require('commands');
require('settings');
require('theme');
require('find');
require('floating_help');
require('sandwich');
require('lsp');
require('treesitter');
require('telescope_setup');
require('snippets');
require('completion');
require('dressing_setup');
require('signature');
require('mappings');

-- Make sure repeat.vim is loaded
vim.cmd("runtime autoload/repeat.vim")
