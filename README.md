# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## What I customized

I simply try to keep a lot of the default LazyVim configuration, but I added some plugins and changed some keymaps to make it a bit more intuitive and faster with some extra for web devellopement.

- Required Mason LSP and Treesitter plugin to devellop in web technologies (js, ts, tsx, jsx, etc)
- Better terminal management! (If you press `2<c-/>`, it will always toggle the number `2` terminal with a simple `<c-/>` after)
- Better and simpler lualine
  - Add project name as the first element (projectName / gitranch / file)
  - I remove some useless elements
- Better dashboard that's more simple and can open project more quickly
  - Cute cat as dashboard ASCII image
- Better Explorer keymaps, fullscreen with preview
  - `<leader>e` Open the explorer on the buffer file
  - `<leader>E` Open the explorer on the root of the working directory with all folders closed
  - In all case, the explorer will auto-close when going out of focus or when you select a file
- Easier tabs/buffer management with keymaps on the `<tab>` key
  - `<tab>` will move to the next buffer
  - `<S-tab>` will move to the previous buffer
  - `<leader><tab><tab>` will remove other buffers
  - `<leader><tab>c` will close the rigth buffers
  - `<leader><S-tab>c` will close the left buffers
- Simply add more keymaps to move up and down a line
- Remove markdown `MD013` that limit readme line to 80 characters
