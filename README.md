# ⚡ Modern & Modular Neovim Configuration (Lazy.nvim)

Welcome to this custom **Neovim** configuration built for speed, visual excellence, developer productivity, and extreme modularity. Built on top of the robust [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager, the configuration is neatly structured into logical subdirectories to ensure it remains clean, readable, and highly maintainable.

---

## 🎨 Premium Visual Aesthetics

- **Color Scheme:** [Catppuccin Mocha](https://github.com/catppuccin/nvim) (with custom transparent background enabled for a modern, distraction-free terminal look).
- **Statusline:** [Lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) utilizing a bubbly, rounded separator style (`` / ``).
- **UI Enhancements:** [Noice.nvim](https://github.com/folke/noice.nvim) & [Nvim-Notify](https://github.com/rcarriga/nvim-notify) handling immersive floating notification animations, sleek popup cmdlines, and rounded borders for all LSP windows/dropdowns.

---

## 📁 Modular Directory Structure

All plugins are organized into dedicated categories under `lua/plugins/`. Adding or removing plugins is entirely file-based—simply drop or remove a `.lua` file in the respective folder, and lazy.nvim will handle the rest without editing any core files.

```text
~/.config/nvim/
├── init.lua                   # Main entrypoint
├── lazy-lock.json             # Locked plugin versions
├── README.md                  # Documentation (This file)
└── lua/
    ├── init.lua               # Internal auto-loaded setup
    ├── options.lua            # Global Neovim settings (indents, clipboard, mouse, etc.)
    ├── keymaps.lua            # General keymaps & mouse disabler
    ├── autocmds.lua           # Auto-save & shada temporary file cleaner
    ├── utils.lua              # Global utility functions (diagnostic checks, etc.)
    │
    ├── configs/               # Complex plugin configuration files
    │   ├── lualine.lua        # Custom statusline layout configuration
    │   └── noice.lua          # Filter routes and UI presets for Noice
    │
    └── plugins/               # Modul plugin (lazy.nvim spec)
        ├── init.lua           # Category directory importer
        │
        ├── ui/                # User Interface & Visuals
        │   ├── catppuccin.lua # Catppuccin theme declaration
        │   ├── dashboard-nvim.lua # Banners and dashboard upon startup
        │   ├── devicons.lua   # File & Folder Icons
        │   ├── lualine.lua    # Lualine plugin specs
        │   └── noice.lua      # Noice, Notify, & Nui plugin specs
        │
        ├── editor/            # Coding Intellisense & Navigation
        │   ├── conform.lua    # Auto-formatter specs (stylua, prettier, shfmt, etc.)
        │   ├── gitsigns.lua   # Inline Git change markers & hunk controls
        │   ├── lsp.lua        # Mason, Lspconfig, Inlay Hints, & LSP Attach Keymaps
        │   ├── neotree.lua    # Neo-tree file sidebar explorer
        │   └── treesitter.lua # Syntax highlighting parser, Autotag, & Autopairs
        │
        └── tools/             # Utilities & Developer Tools
            ├── cmp.lua        # Autocompletion Engine, LuaSnip, & Friendly-Snippets
            ├── telescope.lua  # Fuzzy finder for files, text, and LSP symbols
            ├── toggleterm.lua # Embedded terminal splits, tabs, floats, & Lazygit
            ├── oil.lua        # Buffer-based file manager (Oil.nvim)
            ├── yazi.lua       # Yazi terminal file manager integration
            ├── flutter.lua    # Complete Flutter & Dart development suite
            ├── code_runner.lua# Code runner plugin (CRunner)
            ├── which-key.lua  # Visual popup menu reminding keyboard shortcuts
            ├── nvim-dap.lua   # Debug Adapter Protocol setup
            ├── xcodebuild.lua # Xcodebuild integration for iOS/macOS
            └── vimtex.lua     # LaTeX compilation and viewing tools
```

---

## 🛠️ Installation Prerequisites

To get the most out of this configuration, ensure the following dependencies are installed on your system:

1. **Neovim** version `0.9.0` or newer.
2. **Git** for cloning plugins.
3. A **Nerd Font** (e.g., *JetBrainsMono Nerd Font*) set in your terminal for correct icon rendering.
4. Search Utilities (highly recommended for Telescope):
   - `ripgrep` (for rapid Live Grep)
   - `fd` (for quick file search)
5. **Node.js** and **npm** (required by several LSP servers such as `ts_ls`, `vue_ls`, etc.).
6. **Lazygit** (for interactive floating terminal Git operations).

---

## 🚀 Quick Start

Clone this repository directly into your Neovim configuration directory:

### macOS / Linux:
```bash
git clone https://github.com/username/nvim-config.git ~/.config/nvim
```

Open Neovim:
```bash
nvim
```
*On initial startup, `lazy.nvim` will automatically download and install all plugins. Once the installation is complete, restart Neovim.*

---

## 📌 Keymap Cheat-Sheet

The main `<leader>` key is mapped to the Spacebar (`SPC` / `Space`).

### 1. Fuzzy Finder Keymaps (Telescope)
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>ff` | `Telescope find_files` | Search for files in the current workspace |
| `<leader>fg` | `Telescope live_grep` | Live search for text across all files |
| `<leader>fb` | `Telescope buffers` | Show and switch between open buffers |
| `<leader>fh` | `Telescope help_tags` | Search Neovim documentation help tags |
| `<leader>fs` | `Telescope lsp_document_symbols` | Search symbols (functions, classes, variables) in file |

### 2. File Explorer Keymaps (Navigations)
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>e` | `Neotree toggle left` | Toggle Neo-tree sidebar explorer |
| `<leader>o` | `Neotree focus` | Move cursor focus to Neo-tree sidebar |
| `<leader>-` | `YaziToggle` | Open Yazi terminal file manager |
| `Oil` (Command) | `:Oil` | Open buffer-based editor as file explorer (Oil.nvim) |

### 3. Integrated Terminal Keymaps (ToggleTerm)
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>tf` | `ToggleTerm float` | Open/toggle a floating terminal |
| `<leader>th` | `_NEW_HORIZONTAL_TERM()` | Spawn a new horizontal split terminal (15 lines high) |
| `<leader>tn` | `_NEW_VERTICAL_TERM()` | Spawn a new vertical split terminal (80 columns wide) |
| `<leader>ts` | `_NEW_TAB_TERM()` | Spawn a new terminal in a separate Neovim tab |
| `<leader>tg` | `_LAZYGIT_TOGGLE()` | Open interactive **Lazygit** client (floating) |

*(Within terminal windows, press `<esc>` or `jk` to enter terminal normal mode, and `<C-h>/<C-j>/<C-k>/<C-l>` to switch panels seamlessly).*

### 4. Language Server Keymaps (LSP)
These keymaps are bound dynamically **only** when a language server (LSP) attaches to the current buffer.

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `gd` | `vim.lsp.buf.definition()` | Go to symbol definition |
| `gD` | `vim.lsp.buf.declaration()` | Go to symbol declaration |
| `gr` | `vim.lsp.buf.references()` | Show list of references |
| `gi` | `vim.lsp.buf.implementation()` | Go to implementation |
| `K` | `vim.lsp.buf.hover()` | Show documentation/signature on hover |
| `<C-k>` *(Insert)* | `vim.lsp.buf.signature_help()` | Show signature helper while typing |
| `<leader>rn` | `vim.lsp.buf.rename()` | Rename symbol safely across the project |
| `<leader>ca` | `vim.lsp.buf.code_action()` | Open quick code action suggestions |
| `<leader>f` | `vim.lsp.buf.format()` | Manually format current file (LSP fallback enabled) |
| `[d` | `vim.diagnostic.goto_prev()` | Go to previous diagnostic error/warning |
| `]d` | `vim.diagnostic.goto_next()` | Go to next diagnostic error/warning |
| `<leader>vd` | `vim.diagnostic.open_float()` | Show line diagnostic details in a hover window |

### 5. Execution Keymaps (Code Runner)
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>rr` | `:RunCode` | Execute project-wide scripts or custom run setups |
| `<leader>rf` | `:RunFile` | Execute the currently active file |
| `<leader>rp` | `:RunProject` | Run the active project (integrates with FlutterRun on Dart) |

### 6. Core Editor & Motion Keymaps
- `;` is remapped to `:` for immediate command entry.
- `[p` pastes text with an empty newline inserted above the current line.
- `]p` pastes text with an empty newline inserted below the current line.
- `Y` in Visual mode yanks text and moves the cursor automatically to the end of the selection.
- Arrow keys (`<Up>`, `<Down>`, `<Left>`, `<Right>`) and `<BS>` (Backspace) are disabled in normal and insert modes in regular buffers to cultivate strong habits of using classic Neovim movements (`h/j/k/l`).
- Mouse dragging/clicking keymaps (`<LeftMouse>` / `<RightMouse>`) are disabled to prevent accidental cursor repositioning.

### 7. LaTeX Keymaps (Vimtex)
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>lc` | `:VimtexCompile` | Toggle LaTeX compilation |
| `<leader>lv` | `:VimtexView` | View compiled PDF |
| `<leader>lx` | `:VimtexClean` | Clean Aux files |
| `<leader>lX` | `:VimtexClean!` | Clean all files including PDF |
| `<leader>lt` | `:VimtexTocToggle`| Toggle Table of Contents |
| `<leader>le` | `:VimtexErrors` | Show LaTeX errors |
| `<leader>li` | `:VimtexInfo` | Show LaTeX info |
| `<leader>ls` | `:VimtexStatus` | Show compiler status |

---

## ⚙️ Automated Features

1. **Auto Save on Change:** Neovim automatically saves your buffer content on leaving insert mode (*InsertLeave*) or when text is modified (*TextChanged*), provided the buffer is writeable and has a valid file name.
2. **ShaDa Temporary File Cleanup:** The configuration automatically scans and purges leftover temporary `main.shada.tmp.*` files upon quitting Neovim (*VimLeavePre*), keeping your data storage clean.
3. **Smart Auto-formatting:** Files of type Lua, TypeScript, JSON, Shell script, Vue, Handlebars, and Markdown are formatted automatically upon leaving insert mode or saving, using local linter engines integrated via [conform.nvim](https://github.com/stevearc/conform.nvim).
