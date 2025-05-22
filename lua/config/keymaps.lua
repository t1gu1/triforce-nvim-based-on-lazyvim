---@diagnostic disable: undefined-field

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Search
map("n", "<leader>d/", "<cmd>noh<cr>", { desc = "Turn off highlighting until the next search" })

map({ "n", "v" }, "<leader>ff", function()
  Snacks.picker.files({ hidden = true })
end, { desc = "Find a file" })

map({ "n", "v" }, "<leader>fw", function()
  Snacks.picker.grep({ regex = false, hidden = true })
end, { desc = "Find a words / text" })

map({ "n", "v" }, "<leader>f<leader>", function()
  Snacks.picker.resume()
end, { desc = "Find a words / text" })

map({ "n", "v" }, "<leader>fr", function()
  require("grug-far").open()
end, { desc = "Find and replace" })

map({ "n", "v" }, "<leader>ft", function()
  vim.api.nvim_feedkeys(" st", "m", false)
end, { desc = "Find TODO in the project" })

-- Explorer
map("n", "<leader>e", function()
  Snacks.explorer.open()
end, { desc = "Explorer - Reveal active file" })

map("n", "<leader>E", function()
  Snacks.explorer.open({
    follow_file = false,
    on_show = function(picker)
      picker:action("explorer_close_all")
    end,
  })
end, { desc = "Explorer - Reveal root project" })

-- Code
map({ "n", "v" }, "<c-a>", "ggvG", { desc = "Select all" })
map({ "n", "v" }, "<leader>/", "<cmd>normal gcc<cr>", { desc = "Toggle Comments" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "n", "v" }, "<c-f>", function()
  vim.api.nvim_feedkeys(" cu", "m", false)
  vim.api.nvim_feedkeys(" cM", "m", false)
end, { desc = "Remove unused import and add missing imports" })

-- Increment and Decrement a number
map({ "n", "v" }, "<C-=>", function()
  print("increment")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-a>", true, false, true), "i", false)
end, { desc = "Remove unused import and add missing imports" })
map({ "n", "v" }, "<c-->", function()
  print("decrement")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-x>", true, false, true), "i", false)
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
map("n", "<leader><tab><tab>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other buffers" })
map("n", "<leader><S-tab><S-tab>", "<cmd>bdelete<cr>", { desc = "Close active buffer" })
map("n", "<leader>d<tab>", "<cmd>BufferLineCloseRight<cr>", { desc = "Close right buffers" })
map("n", "<leader>d<S-tab>", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close left buffers" })
map("n", "<leader><tab>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffers to the right" })
map("n", "<leader><S-tab>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffers to the left" })

-- Terminal
map("t", "<ESC>", "<cmd>q<cr>", { desc = "Close terminal" })

local lastTerminalNumberOpened = 1

for id = 1, 9 do
  map("n", id .. "<leader>t", function()
    print("Open terminal #" .. id)
    lastTerminalNumberOpened = id
    Snacks.terminal
      .toggle(nil, { cwd = LazyVim.root(), win = { position = "float" }, env = { id = "term" .. lastTerminalNumberOpened } })
      :add_padding()
  end, { desc = "Terminal float opening base on the number #" .. lastTerminalNumberOpened })
end

map("n", "<leader>t", function()
  print("Open terminal #" .. lastTerminalNumberOpened)
  Snacks.terminal
    .toggle(nil, { cwd = LazyVim.root(), win = { position = "float" }, env = { id = "term" .. lastTerminalNumberOpened } })
    :add_padding()
end, { desc = "Terminal float toggle base on the last terminal number opened" })
