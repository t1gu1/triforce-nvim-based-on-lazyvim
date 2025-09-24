local dbAnim = require("dashboardAnimation")

-- local function is_project_root(dir)
--   local markers = { ".git", "package.json", "Cargo.toml", ".project_root" }
--   for _, marker in ipairs(markers) do
--     if vim.fn.findfile(marker, dir .. ";") ~= "" then
--       return true
--     end
--   end
--   return false
-- end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_dashboard",
  callback = function()
    dbAnim.shouldPlayAnimation = true
    dbAnim.asciiImg = dbAnim.frames[1]
  end,
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = function()
    dbAnim.shouldPlayAnimation = false
    -- Optionally, you can use is_project_root(vim.fn.getcwd()) if you want to check and act differently
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

      terminal = {
        win = {
          keys = {
            exit = { "<ESC>", "<cmd>q<cr>", desc = "Exit", expr = true, mode = { "t", "n" } },
            term_normal = {
              "<c-/>",
              function()
                vim.cmd("stopinsert")
                local timer = vim.loop.new_timer()
                if timer then
                  timer:start(
                    10,
                    0,
                    vim.schedule_wrap(function()
                      vim.api.nvim_feedkeys("/", "n", true)
                    end)
                  )
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

      dashboard = {
        on_close = function()
          dbAnim.shouldPlayAnimation = false
        end,
        preset = {
          header = false,
          pick = nil,
          keys = {
            {
              icon = " ",
              key = "p",
              desc = "Projects",
              action = function()
                Snacks.picker.projects({
                  sort = { fields = { "time:asc", "idx" } },
                  on_close = function()
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
                  on_close = function()
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
