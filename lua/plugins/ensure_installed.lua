return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettier",
        "lua-language-server",
        "astro-language-server",
        "stylua",
        "eslint_d",
        "jsonlint",
        "quick-lint-js",
        "fixjson",
        "prettierd",
        "luacheck",
        "markdownlint-cli2",
        "tailwindcss-language-server",
        "vtsls",
        -- "gopls", -- GoLang
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "bash",
        "html",
        "json",
        "lua",
        "markdown_inline",
        "python",
        "regex",
        "vim",
        "yaml",
      },
    },
  },
}
