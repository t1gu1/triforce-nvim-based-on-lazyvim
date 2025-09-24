# ꧁ ༺ Triforce Nvim ༻ ꧂

<!--toc:start-->

- [꧁ ༺ Triforce Nvim ༻ ꧂](#triforce-nvim)
  - [What I customized](#what-i-customized)
  - [Preview](#preview)
  <!--toc:end-->

A nice configuration based on 💤[LazyVim](https://github.com/LazyVim/LazyVim).

First, refer to the [documentation](https://lazyvim.github.io/installation) to get started and get info of what i don't customized!

Then clone it: `git clone git@github.com:t1gu1/triforce-nvim-based-on-lazyvim.git ~/.config/nvim`

<https://github.com/user-attachments/assets/ada5e607-5871-4061-961d-4ae4fba76211>

## Pre-requise

- Use one of those recommended terminal if you want to see **images**
  - Ghostty
  - Kitty
  - WezTerm
- Install these:
  - `imagemagick` (To see more than only PNG)
  - `git`
  - `curl`
  - `ripgrep`
  - `fd-find` (Used by Snacks explorer / File manager)
  - `luarocks`
  - `fzf`
  - `lazygit`
    - On ubuntu: `curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"`
- If on linux it is nice to install:
  - `wl-clipboard` (For Wayland seemless copy/paste)
  - On ubuntu, install `build-essential` (Will install the C compiler)
- For javascript LSP
  - Install NodeJS
  - Run `npm install -g neovim`

## What I customized

## Customizations Overview

This configuration keeps most of the default LazyVim setup, with added plugins and keymaps for a faster, more intuitive experience—especially for web development.

### Appearance

- Clean look with custom Tokyo theme (soft yellow tint to match ASCII dashboard).

### Web Development Support

- Mason, LSP, and Treesitter plugins for JS, TS, TSX, JSX, etc.

### Terminal Management

- `<leader>t`: Toggle last active terminal.
- `2<leader>t`: Toggle terminal 2 (or `1<leader>t`, `3<leader>t`, etc.).
- `<ESC>`: Close terminal window.
- `<c-/>`: Search in terminal.
- `<c-.>`: Clear terminal search highlight.

### Copilot

Adjusted to use shadow text with full Copilot suggestion available (previously limited by Blink).

#### Copilot Suggestions

- `<C-cr>`: Accept suggestion.
- `<C-w>`: Accept word from suggestion.
- `<C-l>` / `<C-right>`: Accept and move to next line.
- `<C-h>` / `<C-left>`: Cancel suggestion.
- `<C-]>` / `<C-[>`: Request new suggestion.

#### Copilot Chat

- `<leader>aa`: Open Copilot Chat.
- In Copilot Chat buffer:
  - `<C-s>`: Send message.
  - `<C-cr>`: Accept suggestion.

### Statusline (Lualine)

- Shows project name, Git branch, and diff.
- File name removed (already shown in buffer).

### Dashboard

- Fast project access, ordered by last opened.
- Simple layout with essential options.

### Code Actions

- `<c-f>`: Add missing imports / remove unused ones.

### Explorer

- `<leader>e`: Open at buffer file location.
- `<leader>E`: Open at project root (all folders closed).
- Auto-closes when unfocused or file selected.
- Always on the right (doesn't shift code).

### Search

- `<leader>ff`: Find files.
- `<leader>fw`: Find words.
- `<leader>f<leader>`: Resume previous search.
- `<leader>ft`: Find TODOs.
- `<leader>fr`: Search and replace.

### Buffer/Tab Management

- `<tab>`: Next buffer.
- `<S-tab>`: Previous buffer.
- `<leader><tab><tab>`: Close other buffers.
- `<leader><S-tab><S-tab>`: Close active buffer.
- `<leader>d<tab>`: Close buffers to the right.
- `<leader>d<S-tab>`: Close buffers to the left.
- `<leader><tab>`: Move active buffer right.
- `<leader><S-tab>`: Move active buffer left.

### Line and Indent Movement

- `<S-j>`, `<S-k>`, `<S-up>`, `<S-down>`: Move lines.
- `<Tab>`, `<S-Tab>`: Indent/unindent in Insert/Visual mode.

### Markdown Rules

- Custom rules in config:
  - Disabled: `MD033` (HTML allowed), `MD013` (line length), `MD043` (emoji in headings).

### Other Shortcuts

- `<leader>/`: Comment/uncomment line.
- `<leader>d/`: Clear last search highlight.
- `<c-a>`: Select all (`ggvG`).
- `<C-=>`, `<C-->`: Increase/decrease number.

## Preview

![image](https://github.com/user-attachments/assets/75c56e1c-f7ed-454c-9138-070c7aebe917)

![image](https://github.com/user-attachments/assets/a052a426-c59b-4221-aadf-5ce226936ec2)

![image](https://github.com/user-attachments/assets/296b1cd2-b8f2-43e8-89dd-d5f2c1011ac9)

![image](https://github.com/user-attachments/assets/75bf6e30-3e85-4bf1-a8bc-075051331419)
