return {
  {
    "folke/snacks.nvim",

    ---@type snacks.Config
    opts = {
      image = { enabled = true },

      -- Terminal
      terminal = {
        win = {
          keys = {
            exit = { "<ESC>", "<cmd>q<cr>", desc = "Exit", expr = true, mode = { "t", "n" } },
            term_normal = {
              "<c-/>",
              function(self)
                vim.cmd("stopinsert")

                local timer = vim.loop.new_timer()
                local start_up_func = function()
                  vim.api.nvim_feedkeys("/", "n", true)
                end
                if timer ~= nil then
                  timer:start(10, 0, vim.schedule_wrap(start_up_func))
                end
              end,
              mode = { "t", "n" },
              expr = true,
              desc = "Double escape to normal mode",
            },
            hide_search_highlight = {
              "<c-.>",
              "<cmd>noh<cr>",
              desc = "Turn off highlighting until the next search",
              expr = true,
              mode = { "t", "n" },
            },
          },
        },
      },

      -- EXPLORER MENU
      picker = {
        sources = {
          explorer = {
            path = LazyVim.root(),
            auto_close = true,
            layout = {
              preset = "vscode",
              layout = { position = "right" },
            },
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
            {
              icon = " ",
              key = "p",
              desc = "Projects",
              action = function()
                Snacks.picker.projects({ sort = { fields = { "time:asc", "idx" } } })
              end,
            },
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
