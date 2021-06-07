-- map
-- 
-- Some utility functions for mapping keys

local M = {}

-- functions to make the rhs of mappings
function M.command(line)
    return '<cmd>' .. line .. '<cr>'
end

function M.call(call)
    return M.command('call ' .. call)
end

function M.call_lua(module, call)
    return M.command('lua require("' .. module .. '").' .. call)
end

function M.plug(keys)
    return '<Plug>' .. keys
end

function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M;
