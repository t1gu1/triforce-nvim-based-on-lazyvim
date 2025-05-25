return {
  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      math.randomseed(os.time())
      local choose = function(choices)
        return choices[math.random(1, #choices)]
      end
      opts.lualine_bold = true
      opts.on_highlights = function(hl, c)
        -- Here is Tokyonight's default colors (https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors/moon.lua)
        hl["SnacksDashboardHeader"] = {
          fg = choose({
            -- c.green,
            -- c.magenta,
            -- c.orange,
            -- c.purple,
            -- c.red,
            c.yellow,
          }),
        }
        -- Use that following command to see the available highlights
        -- Snacks.picker.highlights({pattern = "hl_group:^SnacksDashboard"})
        hl["SnacksDashboardTitle"] = { fg = c.magenta, bold = true }
        hl["SnacksDashboardIcon"] = { fg = c.yellow, bold = true }
        hl["SnacksDashboardDesc"] = { fg = c.fg, bold = true }
        hl["SnacksDashboardKey"] = { fg = c.yellow, bold = true }
      end
      return opts
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "rainbow-delimiters.setup",
  },
}
