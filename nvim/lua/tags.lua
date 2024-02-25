local utils = require("nvim-treesitter.ts_utils")
local M = {}

local dont_close = {
    area = true,
    base = true,
    br = true,
    col = true,
    command = true,
    embed = true,
    hr = true,
    img = true,
    slot = true,
    input = true,
    keygen = true,
    link = true,
    meta = true,
    param = true,
    source = true,
    track = true,
    wbr = true,
    menuitem = true,
}

local function tag_name_for_node_html(node)
    if node:type() == "element" then
        node = node:named_child(0)
    else
        return nil
    end
    if node and node:type() == "start_tag" then
        node = node:named_child(0)
    else
        return nil
    end
    if node and node:type() == "tag_name" then
        return vim.treesitter.get_node_text(node, 0)
    else
        return nil
    end
end

local function tag_name_for_node_jsx(node)
    if node:type() == "jsx_element" then
        node = node:named_child(0)
    else
        return nil
    end
    if node and node:type() == "jsx_opening_element" then
        node = node:named_child(0)
    else
        return nil
    end
    if node and node:type() == "identifier" then
        return vim.treesitter.get_node_text(node, 0)
    else
        return nil
    end
end

local function tag_name_for_node(node)
    return tag_name_for_node_html(node) or tag_name_for_node_jsx(node)
end

local function find_tag_name()
    local node = utils.get_node_at_cursor()
    if node and node:type() == "text" then
        node = node:parent()
    end
    local tag_name = tag_name_for_node(node)
    if tag_name == nil then
        return nil
    elseif dont_close[tag_name] then
        return tag_name_for_node(node:parent())
    else
        return tag_name
    end

end

function M.close_tag()
    local tag_name = find_tag_name()
    if tag_name then
        vim.fn.feedkeys("</" .. tag_name .. ">" .. vim.api.nvim_replace_termcodes("<c-o>", true, true, true) .. "==")
    end
end

function M.move_to_tag_end()
    local node = utils.get_node_at_cursor()
    if node == nil then
        return
    elseif node:type() ~= "element" then
        node = node:parent()
    end
    local row, col = node:end_()
    vim.api.nvim_win_set_cursor(0, {row + 1, col})
end

return M
