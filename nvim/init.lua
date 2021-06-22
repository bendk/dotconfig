vim.g.mapleader = ","

require('utils');
require('commands');
require('settings');
require('theme');
require('find');
require('floating_help');
require('sandwich');
require('lsp');
require('treesitter');
require('mappings');

-- Make sure repeat.vim is loaded
vim.cmd("runtime autoload/repeat.vim")
