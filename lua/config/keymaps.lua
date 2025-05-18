-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Code
map({ "n", "v" }, "<leader>/", "<cmd>normal gcc<cr>", { desc = "Toggle Comments" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Tabs
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Tab" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab><tab>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>c", "<cmd>BufferLineCloseRight<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><S-tab>c", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close Other Tabs" })

-- Terminal
local lastNumber = 1
map("n", "1", function()
  lastNumber = 2
end, { desc = "Terminal" })
map("n", "2", function()
  lastNumber = 2
end, { desc = "Terminal" })

map("n", "<c-/>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal" })
