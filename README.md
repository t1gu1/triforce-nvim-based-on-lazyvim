# 💤 LazyVim

A nice config based on [LazyVim](https://github.com/LazyVim/LazyVim).

First, refer to the [documentation](https://lazyvim.github.io/installation) to get started and get info of what i don't customized!

Then clone it: `git clone https://github.com/t1gu1/lazyvim-config ~/.config/nvim`

<img width="1725" alt="Dashboard" src="https://github.com/user-attachments/assets/66091d13-0c43-4303-8bf2-f9546bed6100" />

## What I customized

I simply try to keep a lot of the default LazyVim configuration, but I added some plugins and changed some keymaps to make it a bit more intuitive and faster with some extras for web development.

- Add the requires Mason, LSP, and Treesitter plugins **to develop in web technologies** (JS, TS, TSX, JSX, etc.)
- Improved **terminal** management:
  - Press `2<c-/>` to toggle terminal 2, then `<c-/>` to toggle it again.
- Simplified **Lualine**:
  - Project name as the first element (projectName / gitranch)
  - Removed unnecessary elements like the file name since it is already show as the buffer
- Streamlined **Dashboard**:
  - Faster project access
  - Simpler layout with only the necessary options
  - Cute cat ASCII art
- **Add missing imports** and **Remove unused ones** with `<c-f>`
- **Enhanced explorer** keymaps:
  - `<leader>e`: Open explorer on **buffer file location**
  - `<leader>E`: Open explorer at **project root** with **all folders closed**
  - Explorer auto-closes when unfocused or a file is selected
  - I always put it to the **right** because it doesn't move/push the code when it open the view
- Classic `<leader>ff` and `<leader>fw` to **search for files and words** in the project
  - Add `<leader>ft` in that logic to **find TODO(s)**
- Easier tab/buffer management with `<tab>` keymaps:
  - `<tab>`: Next buffer
  - `<S-tab>`: Previous buffer
  - `<leader><tab><tab>`: Remove other buffers
  - `<leader><tab>c`: Close right buffers
  - `<leader><S-tab>c`: Close left buffers
- Additional keymaps to **move up and down a line(s)**
- Add **Markdown general rules** inside nvim config itself
  - Removed some **Markdown Rules**
    - `MD033` rule that doesn't allow HTML
    - `MD013` rule that limits README lines to 80 characters
    - `MD043` rule that don't accept emoji in heading title...

## Preview

<img width="1725" alt="Explorer" src="https://github.com/user-attachments/assets/ff2717a7-fa87-4aba-b482-8ff5e7c30efd" />

<img width="1725" alt="TSX" src="https://github.com/user-attachments/assets/654d4cd6-a522-4fa8-9202-e98a4dca7d17" />

<img width="1725" alt="Lazygit" src="https://github.com/user-attachments/assets/d7f69086-6d66-4d45-bf32-f11939eade24" />
