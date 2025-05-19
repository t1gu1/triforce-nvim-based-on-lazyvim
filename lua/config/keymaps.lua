-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/ ua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- A general {ActionNumber} that can be used in functions (Like the terminal)
local actionNumber = 1

for id = 1, 9 do
  map("n", id .. "", function()
    actionNumber = id
  end, { desc = "Set action number to #" .. id })
end

-- Search
map({ "n", "v" }, "<leader>ff", function()
  Snacks.picker.files({ hidden = true })
end, { desc = "Find a file in the project" })

map({ "n", "v" }, "<leader>fw", function()
  Snacks.picker.grep({ regex = false, hidden = true })
end, { desc = "Find a words / text in the project" })

map({ "n", "v" }, "<leader>ft", function()
  vim.api.nvim_feedkeys(" st", "m", false)
end, { desc = "Find TODO in the project" })

-- Explorer

--- Method used in the 2 shortcuts
function ExplorerToggle()
  Snacks.explorer.open({
    path = LazyVim.root(),
    auto_close = true,
    layout = {
      preset = "vscode",
      preview = false, -- Preview already visible in find file (<leader>ff) and find text (<leader>fw)
      layout = { position = "right" },
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
map({ "n", "v" }, "<c-f>", function()
  vim.api.nvim_feedkeys(" cu", "m", false)
  vim.api.nvim_feedkeys(" cM", "m", false)
end, { desc = "Remove unused import and add missing imports" })

-- Move Lines
map("n", "<c-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<c-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("n", "<c-DOWN>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<c-UP>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("v", "<c-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<c-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
map("v", "<c-DOWN>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<c-UP>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Tabs
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Tab" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab><tab>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>c", "<cmd>BufferLineCloseRight<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><S-tab>c", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close Other Tabs" })

-- Terminal
map("n", "<c-/>", function()
  print("Open terminal #" .. actionNumber)
  Snacks.terminal
    .toggle(nil, { cwd = LazyVim.root(), win = { position = "float" }, env = { id = "term" .. actionNumber } })
    :add_padding()
end, { desc = "Terminal float toggle base on action number {actionNumber}" })

map("n", "<c-\\>", function()
  print("Open terminal #" .. actionNumber)
  Snacks.terminal
    .toggle(nil, { cwd = LazyVim.root(), win = { position = "bottom" }, env = { id = "term" .. actionNumber } })
    :add_padding()
end, { desc = "Terminal bottom toggle base on action number {actionNumber}" })
