local nvimFolder = vim.fn.stdpath("config")

return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint-cli2" },
    },
    linters = {
      ["markdownlint-cli2"] = {
        args = {
          "--config",
          nvimFolder .. "/lua/plugins/cfg_linters/global.markdownlint-cli2.yaml",
          "--",
        },
      },
    },
  },
}
