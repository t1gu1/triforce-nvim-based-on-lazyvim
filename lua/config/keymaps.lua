---@diagnostic disable: undefined-field

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Unmap old way to toggle terminal
unmap("n", "<c-/>")

-- Macro trigger
map({ "n", "v" }, ";", "@q", { desc = "Trigger macro in register q" })

-- Delete/Change without yanking
for _, key in ipairs({ "d", "D", "c", "C" }) do
  map(
    { "n", "v" },
    key,
    '"_' .. key,
    { desc = (key:lower() == "d" and "Delete" or "Replace") .. " without remove yank" }
  )
end
for _, key in ipairs({ "x", "X" }) do
  map("n", key, '"_' .. key, { desc = "Remove without remove yank" })
end

-- Indents
map("i", "<Tab>", "<cmd>><cr>", { desc = "Indent" })
map("i", "<S-Tab>", "<cmd><<cr>", { desc = "Remove indent" })
map("v", "<Tab>", ">gv", { desc = "Indent a selection" })
map("v", "<S-Tab>", "<gv", { desc = "Remove an indent to a selection" })

-- Search
map("n", "<leader>d/", "<cmd>noh<cr>", { desc = "Turn off highlighting until the next search" })

-- File pickers
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

-- Copilot
map("i", "<c-right>", "<cmd>Copilot suggestion accept_line<cr>", { desc = "Select all" })
map("i", "<c-left>", "<cmd>Copilot suggestion dismiss<cr>", { desc = "Select all" })

-- Code
map({ "n", "v" }, "<c-a>", "ggvG", { desc = "Select all" })
map({ "n", "v" }, "<leader>/", "<cmd>normal gcc<cr>", { desc = "Toggle Comments" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "n", "v" }, "<c-f>", function()
  vim.api.nvim_feedkeys(" cu", "m", false)
  vim.api.nvim_feedkeys(" cM", "m", false)
end, { desc = "Remove unused import and add missing imports" })

-- Move Lines (Normal, Insert, Visual)
local move_mappings = {
  n = {
    ["<S-j>"] = "<cmd>execute 'move .+' . v:count1<cr>==",
    ["<S-k>"] = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
    ["<S-DOWN>"] = "<cmd>execute 'move .+' . v:count1<cr>==",
    ["<S-UP>"] = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
  },
  i = {
    ["<S-DOWN>"] = "<cmd>stopinsert<cr><cmd>execute 'move .+' . v:count1<cr>==<cmd>lua vim.api.nvim_input('a')<cr>",
    ["<S-UP>"] = "<cmd>stopinsert<cr><cmd>execute 'move .-' . (v:count1 + 1)<cr>==<cmd>lua vim.api.nvim_input('a')<cr>",
  },
  v = {
    ["<S-j>"] = ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
    ["<S-k>"] = ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
    ["<S-DOWN>"] = ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
    ["<S-UP>"] = ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
  },
}
for mode, tbl in pairs(move_mappings) do
  for k, v in pairs(tbl) do
    map(mode, k, v, { desc = "Move " .. (k:find("j") or k:find("DOWN") and "Down" or "Up") })
  end
end

-- Tabs
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Tab" })
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab><tab>", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other buffers" })
map("n", "<leader><S-tab><S-tab>", "<cmd>bdelete<cr>", { desc = "Close active buffer" })
map("n", "<leader>d<tab>", "<cmd>BufferLineCloseRight<cr>", { desc = "Close right buffers" })
map("n", "<leader>d<S-tab>", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close left buffers" })
map("n", "<leader><tab>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffers to the right" })
map("n", "<leader><S-tab>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffers to the left" })

-- Terminal
-- There is other keymaps for terminal in dashboard-and-explorer.lua
local lastTerminalNumberOpened = 1

local function OpenTerminal()
  Snacks.terminal.toggle(nil, {
    cwd = LazyVim.root(),
    win = { position = "float", border = "rounded", title = "#" .. lastTerminalNumberOpened },
    env = { id = "term" .. lastTerminalNumberOpened },
  })
end

for id = 1, 9 do
  map("n", id .. "<leader>t", function()
    lastTerminalNumberOpened = id
    OpenTerminal()
  end, { desc = "Terminal float opening base on the number #" .. id })
end

map("n", "<leader>t", function()
  OpenTerminal()
end, { desc = "Terminal float toggle base on the last terminal number opened" })
