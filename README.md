# ꧁ ༺ Triforce Nvim ༻ ꧂

Based on 💤Lazyvim

<!--toc:start-->

- [What I customized](#what-i-customized)
- [Preview](#preview)
<!--toc:end-->

A nice config based on [LazyVim](https://github.com/LazyVim/LazyVim).

First, refer to the [documentation](https://lazyvim.github.io/installation) to get started and get info of what i don't customized!

Then clone it: `git clone https://github.com/t1gu1/lazyvim-config ~/.config/nvim`

![image](https://github.com/user-attachments/assets/7e0d4272-f623-47d3-8e36-441282080ae0)

## What I customized

I simply try to keep a lot of the default LazyVim configuration, but I added some plugins and changed some keymaps to make it a bit more intuitive and faster with some extras for web development.

- Nice and clean with custom tokyo theme adjustments overall (Yellow soft tint to fit with the ASCII dashboard image)
- Add the requires Mason, LSP, and Treesitter plugins **to develop in web technologies** (JS, TS, TSX, JSX, etc.)
- Improved **terminal** management:
  - Press `<leader>t` to toggle the last active terminal.
  - When terminal is open, simply press `<ESC>` to "close" the terminal window
  - Press `2<leader>t` to toggle terminal 2, then `<leader>t` will toggle that same terminal.
    - Just an example of how open different terminals `1<leader>t`, `2<leader>t`, `3<leader>t`, etc
  - When terminal is open, press `<c-/>` to search a words in the terminal
    - When terminal is open and you see search hilight, press `<c-.>` to stop the highlight
- **Copilot suggestion** keymaps and behavior ajustments:
  - `<C-cr>` to accept the Copilot suggestion
  - `<C-w>` to accept a **word** from the Copilot suggestion
  - `<C-l>` or `<C-right>` to accept the Copilot suggestion and move to the next line
  - `<C-h>` or `<C-left>` to cancel the Copilot suggestion
  - `<C-]>` or `<C-[>` to ask Copilot to generate a new suggestion
- **Copilot Chat** keymaps
  - `<leader>aa` to open Copilot Chat
  - When you are in a Copilot Chat buffer:
    - `<C-s>` to send what you wrote in to Copilot Chat
    - `<C-cr>` to accept the Copilot suggestion
- Simplified **Lualine**:
  - Project name as the first element (**ProjectName** / GitBranch / Diff)
  - Removed unnecessary elements like the file name since it is already show as the buffer
- Streamlined **Dashboard**:
  - Faster project access and ordered by last "time project was open"
  - Simpler layout with only the necessary options
- **Add missing imports** and **Remove unused ones** with `<c-f>`
- **Enhanced explorer** keymaps:
  - `<leader>e`: Open explorer on **buffer file location**
  - `<leader>E`: Open explorer at **project root** with **all folders closed**
  - Explorer auto-closes when unfocused or a file is selected
  - I always put it to the **right** because it doesn't move/push the code when it open the view
- Classic `<leader>ff` and `<leader>fw` to **search for files and words** in the project
- Add `<leader>f<leader>` to resume a previous search
  - Add `<leader>ft` in that logic to **find TODO(s)**
  - Add `<leader>fr` in that logic to search and replace
- Easier tab/buffer management with `<tab>` keymaps:
  - `<tab>`: Next buffer
  - `<S-tab>`: Previous buffer
  - `<leader><tab><tab>`: Close other buffers
  - `<leader><S-tab><S-tab>`: Close active buffer
  - `<leader>d<tab>`: Close right buffers
  - `<leader>d<S-tab>`: Close left buffers
  - `<leader><tab>`: Move the active buffer to the right
  - `<leader><S-tab>`: Move the active buffer to the left
- Additional keymaps to **move up and down a line(s)**
  - `<S-j>`, `<S-k>`, `<S-up>`, `<S-down>`, can move lines
  - I kept the default ones unsing the **Options** button
- Add keymaps to manipulation the **indentation** in `Insert` and `Visual` mode:
  - `<Tab>` and `<S-Tab>` to indent/unindent
- Add **Markdown general rules** inside nvim config itself
  - Removed some **Markdown Rules**
    - `MD033` rule that doesn't allow HTML
    - `MD013` rule that limits README lines to 80 characters
    - `MD043` rule that don't accept emoji in heading title...
- Some other nice shortcuts
  - `<leader>/` to comment/uncomment a line
  - `<leader>d/` to stop the highlight of the last search
  - `<c-a>` to do a select all (`ggvG`)
  - `<C-=>` and `<C-->` to increase/decrease a number

## Preview

![image](https://github.com/user-attachments/assets/8414cbb2-4f09-4486-908a-ec544209c5c3)

![image](https://github.com/user-attachments/assets/63f81dc2-45ea-4669-a973-53b717e3dd74)

![image](https://github.com/user-attachments/assets/5d0d8d28-ac58-44fe-a7fb-6abe5103aa36)

![image](https://github.com/user-attachments/assets/6cd7dfcc-d407-4621-b471-483927a9fa7c)

![image](https://github.com/user-attachments/assets/9a32d1fb-dd03-4b45-a924-43cb2c0996d8)
