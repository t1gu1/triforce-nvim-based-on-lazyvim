return {
  -- If you change tokyonight for another colorscheme, you have to specefy it in the LazyVim options
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  -- My chosen colorscheme
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

        -- Generic highlights
        hl["CursorLineNr"] = { fg = c.blue, bold = true }
        hl["IncSearch"] = { fg = c.bg, bg = c.blue, bold = true }
        hl["CurSearch"] = { fg = c.bg, bg = c.blue, bold = true }
        hl["YankyYanked"] = { fg = c.bg, bg = c.blue, bold = true }
        hl["Visual"] = { bg = c.bg_highlight, bold = true }

        -- Dashboard
        hl["SnacksDashboardTitle"] = { fg = c.fg, bold = true }
        hl["SnacksDashboardHeader"] = { fg = c.blue, bold = true }
        hl["SnacksDashboardIcon"] = { fg = c.blue, bold = true }
        hl["SnacksDashboardDesc"] = { fg = c.fg, bold = true }
        hl["SnacksDashboardKey"] = { fg = c.blue, bold = true }

        -- Picker Explorer
        hl["SnacksPickerInputTitle"] = { fg = c.blue, bold = true }
        hl["SnacksPickerInputBorder"] = { fg = c.blue, bold = true }

        -- Explorer icons color
        -- hl["MiniIconsPurple"] = { fg = c.blue, bold = true } -- Src folder
        hl["MiniIconsAzure"] = { fg = c.blue, bold = true }
        hl["MiniIconsBlue"] = { fg = c.react, bold = true } -- React logo

        -- Picker (Search)
        hl["SnacksPickerListCursorLine"] = { bg = c.bg_highlight, bold = true }
        hl["SnacksPickerBoxTitle"] = { fg = c.blue, bold = true }
        hl["SnacksPickerBoxBorder"] = { fg = c.blue, bold = true }
        -- Right side (Preview)
        hl["SnacksPickerPreviewTitle"] = { fg = c.blue, bold = true }
        hl["SnacksPickerPreviewBorder"] = { fg = c.blue, bold = true }

        -- Terminal
        hl["FloatBorder"] = { fg = c.blue, bold = true }

        -- Noice (CMD with :)
        hl["NoiceCmdlinePopupBorder"] = { fg = c.blue, bold = true }
        hl["NoiceCmdlineIconCmdline"] = { fg = c.blue, bold = true }
        -- Noice (Search)
        hl["FloatTitle"] = { fg = c.blue, bold = true }
        hl["DiagnosticInfo"] = { fg = c.blue, bold = true }
        hl["NoiceCmdlineIconSearch"] = { fg = c.blue, bold = true }
        hl["NoiceCmdlinePopupBorderSearch"] = { fg = c.blue, bold = true }

        -- Markdown
        hl["@markup.heading.1.markdown"] = { fg = c.blue, bold = true }
        hl["@markup.heading.2.markdown"] = { fg = c.blue1, bold = true }
        hl["@markup.heading.3.markdown"] = { fg = c.blue2, bold = true }
        hl["@markup.list.markdow"] = { fg = c.blue, bold = true }
        hl["@punctuation.special.markdown"] = { fg = c.blue, bold = true }
        hl["RenderMarkdownBullet"] = { fg = c.blue, bold = true }
        hl["RenderMarkdownTableRow"] = { fg = c.blue, bold = true }
        hl["RenderMarkdownTableHead"] = { fg = c.blue, bold = true }
        hl["RenderMarkdownDash"] = { fg = c.blue, bold = true }
        hl["MatchParen"] = { fg = c.blue3, bold = true }
      end

      opts.on_colors = function(c)
        c.blue = "#FFFCEB"
        c.blue1 = "#fcdfb3"
        c.blue2 = "#FFF6C3"
        c.blue3 = "#dcaf93"
        c.react = "#61DBFB"
      end
      return opts
    end,
  },
  -- Rainbox brackets, parentheses, and other delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "rainbow-delimiters.setup",
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Show a searchbox for the search command
      opts.presets.bottom_search = false
      return opts
    end,
  },
}
