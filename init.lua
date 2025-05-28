-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Use to enable context comments like React component templating comments
local function calculate_commentstring()
  return require("ts_context_commentstring.internal").calculate_commentstring()
end

local get_option = vim.filetype.get_option
---@diagnostic disable-next-line: duplicate-set-field
vim.filetype.get_option = function(filetype, option)
  if pcall(calculate_commentstring) then
    return calculate_commentstring()
  else
    return get_option(filetype, option)
  end
end
