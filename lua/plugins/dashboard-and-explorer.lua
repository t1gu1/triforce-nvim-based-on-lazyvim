return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      image = { enabled = true },

      -- EXPLORER MENU
      picker = {
        sources = {
          explorer = {
            -- show hidden files like .env
            -- hidden = true,
            -- show files ignored by git like node_modules
            -- ignored = true,
          },
        },
      },

      -- DASHBOARD
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
