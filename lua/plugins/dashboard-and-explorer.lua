local dbAnim = require("dashboardAnimation")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_dashboard",
  callback = function()
    -- Your custom code here that runs when the snacks dashboard filetype is set
    print("Snacks Dashboard is open!")
    dbAnim.shouldPlayAnimation = true
    dbAnim.asciiImg = dbAnim.frames[1]
  end,
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*", -- Match any directory change
  callback = function()
    local new_dir = vim.fn.getcwd()

    -- Same logic as above for project markers
    local project_markers = { ".git", "package.json", "Cargo.toml", ".project_root" }
    local is_project_root = false

    for _, marker in ipairs(project_markers) do
      if vim.fn.findfile(marker, new_dir .. ";") ~= "" then
        is_project_root = true
        break
      end
    end

    if is_project_root then
      -- print("Changed to project directory: " .. new_dir)
      dbAnim.shouldPlayAnimation = false
      -- Your custom code here for when you change into a project directory
    else
      -- print("Changed to non-project directory: " .. new_dir)
      dbAnim.shouldPlayAnimation = false
      -- Optional: Code for when you leave a project directory
    end
  end,
})

return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.defer_fn(function()
        dbAnim.theAnimation(dbAnim.theAnimation)
      end, 100)
    end,

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

                ---@diagnostic disable-next-line: undefined-field
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
        on_close = function()
          dbAnim.shouldPlayAnimation = false
        end,
        preset = {

          -- Go see the theme in `lua/plugins/theme.lua` to change the color of the header
          header = false,
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          ---@type snacks.dashboard.Item[]
          keys = {
            {
              icon = " ",
              key = "p",
              desc = "Projects",
              action = function()
                Snacks.picker.projects({
                  sort = { fields = { "time:asc", "idx" } },
                  on_close = function(info)
                    dbAnim.shouldPlayAnimation = true
                  end,
                })
                dbAnim.shouldPlayAnimation = false
              end,
            },
            {
              icon = " ",
              key = "s",
              desc = "Restore Session",
              action = function()
                require("persistence").load({ last = true })
                dbAnim.shouldPlayAnimation = false
              end,
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = function()
                Snacks.dashboard.pick("files", {
                  cwd = vim.fn.stdpath("config"),
                  on_close = function(info)
                    dbAnim.shouldPlayAnimation = true
                  end,
                })
                dbAnim.shouldPlayAnimation = false
              end,
            },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          {
            section = "header",
            padding = 1,
            function()
              return { header = dbAnim.asciiImg }
            end,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup", enabled = false },
        },
      },
    },
  },
}
