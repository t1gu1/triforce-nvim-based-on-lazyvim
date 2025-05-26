# 💤 LazyVim

A nice config based on [LazyVim](https://github.com/LazyVim/LazyVim).

First, refer to the [documentation](https://lazyvim.github.io/installation) to get started and get info of what i don't customized!

Then clone it: `git clone https://github.com/t1gu1/lazyvim-config ~/.config/nvim`

![image](https://github.com/user-attachments/assets/970f0187-8471-4e04-a345-0efaad9743e1)

## What I customized

I simply try to keep a lot of the default LazyVim configuration, but I added some plugins and changed some keymaps to make it a bit more intuitive and faster with some extras for web development.

- Nice and clean with custom tokyo theme ajustements (Yellow soft tint to fit with the ASCII dashboard image)
- Add the requires Mason, LSP, and Treesitter plugins **to develop in web technologies** (JS, TS, TSX, JSX, etc.)
- Improved **terminal** management:
  - Press `<leader>t` to toggle the last active terminal.
  - When terminal is open, simply press `<ESC>` to "close" the terminal window
  - Press `2<leader>t` to toggle terminal 2, then `<leader>t` will toggle that same terminal.
    - Just an example of how open different terminals `1<leader>t`, `2<leader>t`, `3<leader>t`, etc
  - When terminal is open, press `<c-/>` to search a words in the terminal
    - When terminal is open and you see search hilight, press `<c-.>` to stop the highlight
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
  - `<c-j>`, `<c-k>`, `<c-up>`, `<c-down>`, can move lines
  - I kept the default ones unsing the **Options** button
- Add **Markdown general rules** inside nvim config itself
  - Removed some **Markdown Rules**
    - `MD033` rule that doesn't allow HTML
    - `MD013` rule that limits README lines to 80 characters
    - `MD043` rule that don't accept emoji in heading title...
- Some other nice shorcuts
  - `<leader>/` to comment/uncomment a line
  - `<leader>d/` to stop the highlight of the last search
  - `<c-a>` to do a select all (`ggvG`)
  - `<C-=>` and `<C-->` to increase/decrease a number

## Preview

![image](https://github.com/user-attachments/assets/8d49f073-580a-4c4e-9e18-e0150bc688c6)

![image](https://github.com/user-attachments/assets/f97c38bc-c33c-41f9-8168-764f06209eb0)

![image](https://github.com/user-attachments/assets/101b42f0-f722-4a0c-a1a7-0d76caafdf9f)

