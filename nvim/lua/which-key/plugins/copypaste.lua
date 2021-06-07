-- Copy and paste plugin
--
-- This is basically the registers plugin, but modified to work with my copy/paste keys

local registers = require('which-key.plugins.registers')

M = {}

M.name = "copypaste"
M.actions = {
  { trigger = 'xPr', mode = "n" },
  { trigger = 'xpr', mode = "n" },
}

function M.run(trigger, mode, buf)
    local mappings = registers.run(trigger, mode, buf)
    local command = ""
    if trigger == 'xpr' then
	command = "p"
    elseif trigger == 'xPr' then
	command = "P"
    else
	return {}
    end
    for i, item in ipairs(mappings) do
	mappings[i].label = ''
	mappings[i].cmd = '"' .. mappings[i].key .. command
    end
    return mappings
end

return M
