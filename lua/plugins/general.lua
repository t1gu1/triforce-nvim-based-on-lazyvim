return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
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
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat" },
          lualine_y = { "filetype" },
          lualine_z = { "progress" },
        },
      }
    end,
  },

  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {

        preset = {
          header = [[



 ⟋|､      
(°､ ｡ 7   
|､  ~ヽ   
じしf_,)〳



]],
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
