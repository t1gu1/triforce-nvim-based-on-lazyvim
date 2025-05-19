# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## What I customized

I simply try to keep a lot of the default LazyVim configuration, but I added some plugins and changed some keymaps to make it a bit more intuitive and faster with some extras for web development.

- Requires Mason, LSP, and Treesitter plugins to develop in web technologies (JS, TS, TSX, JSX, etc.)
- Improved terminal management:
  - Press `2<c-/>` to toggle terminal 2, then `<c-/>` to toggle it again.
- Simplified lualine:
  - Project name as the first element (projectName / gitranch / file)
  - Removed unnecessary elements
- Streamlined dashboard:
  - Simpler layout, faster project access
  - Cute cat ASCII art
- Add missing imports and remove unused ones with `<c-f>`
- Enhanced explorer keymaps and fullscreen preview:
  - `<leader>e`: Open explorer on buffer file
  - `<leader>E`: Open explorer at project root with all folders closed
  - Explorer auto-closes when unfocused or a file is selected
- Easier tab/buffer management with `<tab>` keymaps:
  - `<tab>`: Next buffer
  - `<S-tab>`: Previous buffer
  - `<leader><tab><tab>`: Remove other buffers
  - `<leader><tab>c`: Close right buffers
  - `<leader><S-tab>c`: Close left buffers
- Additional keymaps to move up and down a line
- Removed markdown `MD013` rule that limits README lines to 80 characters
