-- Utility functions
--
-- For simplicity sake, just polute the global namespace with these.  This is
-- my vim after all.

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

-- Termcode escape
function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function printout(obj)
    print(vim.inspect(obj))
end
