-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/ ua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Explorer
function ExplorerToggle()
  Snacks.explorer.open({
    path = LazyVim.root(),
    auto_close = true,
    layout = {
      preset = "ivy",
      preview = true,
      layout = { position = "right", width = 120 },
    },
  })
end

map("n", "<leader>e", function()
  ExplorerToggle()
end, { desc = "Explorer - Reveal activve file" })

map("n", "<leader>E", function()
  ExplorerToggle()
  local timer = vim.loop.new_timer()
  local start_up_func = function()
    vim.api.nvim_feedkeys("Z", "m", false)
  end
  if timer ~= nil then
    timer:start(10, 0, vim.schedule_wrap(start_up_func))
  end
end, { desc = "Explorer - Reveal activve file" })

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
local actionNumber = 1

map("n", "1", function()
  actionNumber = 1
end, { desc = "Set action number to 1" })
map("n", "2", function()
  actionNumber = 2
end, { desc = "Set action number to 2" })
map("n", "3", function()
  actionNumber = 3
end, { desc = "Set action number to 3" })
map("n", "4", function()
  actionNumber = 4
end, { desc = "Set action number to 4" })

map("n", "<c-/>", function()
  print("Number: " .. actionNumber)
  Snacks.terminal
    .toggle(nil, { cwd = LazyVim.root(), win = { position = "float" }, env = { id = "term" .. actionNumber } })
    :add_padding()
end, { desc = "Terminal float toggle base on action number" })

map("n", "<c-\\>", function()
  print("Number: " .. actionNumber)
  Snacks.terminal
    .toggle(nil, { cwd = LazyVim.root(), win = { position = "bottom" }, env = { id = "term" .. actionNumber } })
    :add_padding()
end, { desc = "Terminal bottom toggle base on action number" })
