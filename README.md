# ꧁ ༺ Triforce Nvim ༻ ꧂

<!--toc:start-->

- [꧁ ༺ Triforce Nvim ༻ ꧂](#triforce-nvim)
  - [What I customized](#what-i-customized)
  - [Preview](#preview)
  <!--toc:end-->

A nice configuration based on 💤[LazyVim](https://github.com/LazyVim/LazyVim).

First, refer to the [documentation](https://lazyvim.github.io/installation) to get started and get info of what i don't customized!

Then clone it: `git clone https://github.com/t1gu1/lazyvim-config ~/.config/nvim`

![image](https://github.com/user-attachments/assets/18d33415-a01f-48f0-99e5-4bf0d960739f)

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

![image](https://github.com/user-attachments/assets/8414cbb2-4f09-4486-908a-ec544209c5c3)

![image](https://github.com/user-attachments/assets/dc0b323f-0b97-48fb-8f1c-49b3507b0999)

![image](https://github.com/user-attachments/assets/e872dc54-7a37-49a7-82d0-fe6d97915c37)

![image](https://github.com/user-attachments/assets/d00075f1-258e-4934-a12f-b46197af72d8)
