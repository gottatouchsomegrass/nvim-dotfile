# DIPU-VIM 🚀

A modern, feature-rich Neovim configuration based on [NvChad](https://nvchad.com/) v3.0.

Built for developers who code in **C, C++, Go, Python, TypeScript/Next.js, TailwindCSS, and more**.

---

## ✨ Features

### 🎯 Core Features

- **Dashboard**: Beautiful DIPU-VIM ASCII startup screen with quick actions
- **LSP Support**: Full autocomplete, go-to-definition, hover docs for 7+ languages
- **Formatting**: Auto-format code on save with Prettier, Black, Clang-format, etc.
- **Git Integration**: Real-time git indicators (`+/-/~`) in the gutter
- **Terminal**: Floating terminal with `Space + `` ` ``
- **Color Preview**: Inline color visualization for hex, RGB, etc.
- **Markdown**: Beautiful markdown rendering inside Neovim
- **Syntax Highlighting**: Treesitter support for 17+ languages
- **Rainbow Brackets**: Colored bracket pairs for better readability
- **Indent Guides**: Animated indentation scopes (like LazyVim)

### 🛠 Supported Languages

| Language | LSP | Formatter | Treesitter |
|----------|-----|-----------|------------|
| **HTML** | ✅ | Prettier | ✅ |
| **CSS** | ✅ | Prettier | ✅ |
| **JavaScript** | ✅ | Prettier | ✅ |
| **TypeScript** | ✅ | Prettier | ✅ |
| **Next.js/TSX** | ✅ | Prettier | ✅ |
| **TailwindCSS** | ✅ | Prettier | ✅ |
| **Python** | ✅ | Black | ✅ |
| **Go** | ✅ | Gofmt | ✅ |
| **C** | ✅ | Clang-format | ✅ |
| **C++** | ✅ | Clang-format | ✅ |
| **Lua** | ✅ | Stylua | ✅ |
| **JSON** | ❌ | Prettier | ✅ |
| **YAML** | ❌ | ❌ | ✅ |
| **Markdown** | ❌ | ❌ | ✅ |

---

## 📋 Prerequisites

- **Neovim**: v0.9 or higher
- **Node.js**: v18+ (for LSP servers and formatters)
- **Git**: for cloning and plugin management
- **Ubuntu 22.04** or similar Linux distro (or adapt for your OS)

### Check versions:

```bash
nvim --version
node --version
git --version
```

---

## 🚀 Installation

### Step 1: Clone NvChad

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim
cd ~/.config/nvim
git checkout v3.0
```

### Step 2: Clone DIPU-VIM plugins

```bash
# Copy plugin files
cp -r ~/path/to/dipu-vim/lua/plugins/* ~/.config/nvim/lua/plugins/
cp -r ~/path/to/dipu-vim/lua/configs/* ~/.config/nvim/lua/configs/
```

Or if you're starting fresh:

```bash
mkdir -p ~/.config/nvim/lua/plugins
mkdir -p ~/.config/nvim/lua/configs
# Copy the files from your DIPU-VIM repo
```

### Step 3: Add Mason to PATH

Edit `~/.bashrc`:

```bash
# Add this line
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
```

Reload:

```bash
source ~/.bashrc
```

### Step 4: Install LSP servers and formatters

Open Neovim:

```bash
nvim
```

Run:

```vim
:MasonInstall html-lsp cssls typescript-language-server tailwindcss-language-server clangd gopls pyright
:MasonInstall prettier black clang-format stylua
```

Or use `:Mason` UI to search and install manually.

### Step 5: Restart Neovim

```bash
:qa!
nvim
```

You should see the **DIPU-VIM dashboard** on startup! 🎉

---

## ⌨️ Essential Keybindings

### Navigation

```
Space + ff       → Find file
Space + fw       → Find word/grep
Space + e        → Toggle file explorer
Space + fb       → List open buffers
```

### Editing

```
Space + gf       → Format code
Space + /        → Toggle comment
gd               → Go to definition
K                → Show hover documentation
gi               → Go to implementation
Space + ca       → Code actions
```

### UI

```
Space + th       → Theme switcher
Space + `        → Toggle floating terminal
Tab              → Next tab
Shift + Tab      → Previous tab
```

### LSP

```
gd               → Jump to definition
K                → Show type info
gi               → Go to implementation
Space + ca       → Code actions
```

### Git (Gitsigns)

```
Automatic        → Shows +/-/~ in left margin
:Gitsigns        → Opens gitsigns command palette
```

---

## 📁 Project Structure

```
~/.config/nvim/
├── README.md
├── init.lua                    # Entry point
├── lua/
│   ├── chadrc.lua             # NvChad UI config
│   ├── configs/
│   │   ├── conform.lua        # Formatter settings
│   │   ├── lspconfig.lua      # LSP servers
│   │   └── lazy.lua           # lazy.nvim config
│   └── plugins/
│       ├── init.lua           # Core plugins (LSP, Treesitter)
│       ├── dashboard.lua      # Startup screen
│       ├── colorizer.lua      # Color preview
│       ├── formatting.lua     # Format on save
│       ├── gitsigns.lua       # Git indicators
│       ├── rainbow-delimiters.lua
│       ├── render-markdown.lua
│       ├── snacks-nvim.lua    # Indent animations
│       └── toggleterm.lua     # Floating terminal
├── AGENTS.md                  # Contributing guidelines
└── stylua.toml                # Lua formatter config
```

---

## 🔧 Configuration Files

### `chadrc.lua`
Controls NvChad theme and UI settings:
```lua
M.base46 = {
  theme = "onedark",  -- Change theme here
}
M.nvdash = {
  load_on_startup = false,  -- Dashboard settings
}
```

### `lua/configs/lspconfig.lua`
Add or remove language servers:
```lua
local servers = {
  "html", "cssls", "ts_ls", "tailwindcss",
  "clangd", "gopls", "pyright",
}
vim.lsp.enable(servers)
```

### `lua/configs/conform.lua`
Configure formatters:
```lua
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    -- Add more here
  },
}
```

### `lua/plugins/dashboard.lua`
Customize startup screen:
```lua
header = {
  "  ██████╗ ██╗██████╗ ██╗   ██╗       ██╗   ██╗██╗███╗   ███╗",
  -- ... more ASCII art
},
center = {
  { icon = "  ", desc = "New File", key = "n", action = ":ene" },
  -- ... more buttons
},
```

---

## 🎨 Customization

### Change Theme

Press `Space + th` to open theme switcher, or edit `chadrc.lua`:

```lua
M.base46 = {
  theme = "catppuccin",  -- Options: catppuccin, tokyonight, gruvbox, etc.
}
```

### Add a New Language

1. **Add LSP server** in `lua/configs/lspconfig.lua`:
```lua
local servers = {
  "rust-analyzer",  -- Example: add Rust
}
```

2. **Install via Mason**:
```vim
:MasonInstall rust-analyzer
```

3. **Add Treesitter grammar** in `lua/plugins/init.lua`:
```lua
ensure_installed = {
  "rust",  -- Add grammar
}
```

4. **Restart Neovim**.

### Customize Dashboard

Edit `lua/plugins/dashboard.lua`:

```lua
header = {
  -- Change ASCII art here
},
center = {
  {
    icon = "  ",
    desc = "Custom Action",
    key = "c",
    action = ":YourCommand"
  },
},
footer = {
  "Your custom footer text",
},
```

---

## 🐛 Troubleshooting

### LSP not working

```vim
:LspInfo           " Check LSP status
:Mason             " Verify server installed
:checkhealth       " Full health check
```

**Solution**: Ensure Mason PATH is in `~/.bashrc`:
```bash
echo $PATH | grep mason
# If not present, add: export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
source ~/.bashrc
```

### Formatter not found

```vim
:ConformInfo       " Check formatter setup
:MasonInstall prettier black  " Install formatters
```

### Slow startup

```vim
:Lazy              " Check for errors
:Lazy profile      " See startup profile
```

### Tailwind autocomplete not working

- Verify `tailwindcss.config.js` exists in project root
- Check `:LspInfo` → `tailwindcss` should be running
- Restart Neovim

### Colors look wrong

```vim
Space + th         " Change theme
:set termguicolors " Enable true color
```

---

## 📚 Quick Commands

### In Neovim

```vim
:Mason              " Package manager
:Lazy               " Plugin manager
:Lazy profile       " Startup profiling
:Lazy sync          " Update plugins
:checkhealth        " Health check
:LspInfo            " LSP status
:ConformInfo        " Formatter status
:Mason show         " Show installed packages
:TSUpdate           " Update Treesitter grammars
```

### In Terminal

```bash
# Verify Mason is in PATH
echo $PATH | grep mason

# Format Lua files
stylua .

# Test formatters
prettier --check test.js
black --check test.py
clang-format test.c

# Open Neovim in project
cd ~/Projects/my-project
nvim
```

---

## 📖 Usage Examples

### Opening a Project

```bash
cd ~/Projects/my-nextjs-app
nvim
```

The file explorer opens on the left. Navigate with arrow keys.

### Finding Files

```vim
Space + ff         " Opens fuzzy file finder
type: index.tsx    " Search for file
Enter              " Open file
```

### Formatting Code

```vim
Space + gf         " Format entire file
# Or in visual mode
v                  " Enter visual mode
select lines
Space + gf         " Format selection
```

### Using Git

Changes are shown automatically in the left margin:
- `+` = added lines (green)
- `-` = deleted lines (red)  
- `~` = modified lines (blue)

### Floating Terminal

```vim
Space + `          " Open terminal at bottom
# Type bash commands
npm run dev
exit               " Close terminal
Esc                " Back to Neovim
```

---

## 🤝 Contributing

See [AGENTS.md](./AGENTS.md) for development guidelines, code conventions, and how to extend the configuration.

---

## 📦 Plugin List

| Plugin | Purpose |
|--------|---------|
| `nvim-lspconfig` | LSP configuration |
| `nvim-treesitter` | Syntax highlighting |
| `conform.nvim` | Code formatting |
| `dashboard-nvim` | Startup screen |
| `gitsigns.nvim` | Git indicators |
| `toggleterm.nvim` | Floating terminal |
| `nvim-colorizer.lua` | Color preview |
| `render-markdown.nvim` | Markdown rendering |
| `rainbow-delimiters.nvim` | Bracket coloring |
| `snacks.nvim` | UI utilities & indent guides |
| `telescope.nvim` | Fuzzy finder |
| `nvim-tree.lua` | File explorer |

---

## 🔗 Resources

- [NvChad](https://nvchad.com/)
- [Neovim](https://neovim.io/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

---

## 📝 License

This configuration is provided as-is. Feel free to fork, modify, and share!

---

## 💬 Support

If you encounter issues:

1. Check `:checkhealth`
2. Review [AGENTS.md](./AGENTS.md)
3. Check LSP logs: `~/.local/state/nvim/lsp.log`
4. Search existing issues on GitHub

---

## 🎯 What's Next?

- ✅ **Master the keybindings** — Use them daily
- ✅ **Customize the dashboard** — Make it personal
- ✅ **Add more languages** — See "Add a New Language" section
- ✅ **Explore plugins** — Try `:Lazy` to see what's available
- ✅ **Read AGENTS.md** — Understand the architecture

---

**Happy coding! 🚀**

Made with ❤️ using NvChad
