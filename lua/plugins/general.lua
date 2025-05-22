---@param increment boolean
---@param g? boolean
function Dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<c-=>", function() return Dial(true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
      { "<C-->", function() return Dial(false) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
      { "g<C-=>", function() return Dial(true, true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
      { "g<C-->", function() return Dial(false, true) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        sections = {
          lualine_a = {
            function()
              local projectName = vim.fn.getcwd():match("([^/]+)$")
              local firstLetter = projectName:sub(1, 1)
              local restOfString = projectName:sub(2)
              local capitalizedProjectName = firstLetter:upper() .. restOfString
              return capitalizedProjectName
            end,
          },
          lualine_b = { "branch", "diff" },
          lualine_c = { "diagnostics" },
          lualine_x = { "encoding", "fileformat" },
          lualine_y = { "filetype" },
          lualine_z = { "progress" },
        },
      }
    end,
  },
}
