# AGENTS.md: Guidelines for Contributing to DIPU-VIM

## Purpose

Practical, repo-specific guidance for maintaining and extending this
[NvChad](https://github.com/NvChad/NvChad) v2.5 based Neovim configuration.
Covers reload, formatting, LSP setup, and code conventions.

## Scope and Precedence

- Scope: Entire repository unless a deeper AGENTS.md overrides it.
- Precedence: Deeper files > this file; direct user/system instructions > all.
- Intent: Clarify workflow without duplicating NvChad docs.

## Build, Reload, and Health

- Build: No manual build; Neovim loads config automatically via NvChad's lazy.nvim.
- Apply changes: `:source %` (current buffer) or restart Neovim with `:qa!` then `nvim`.
- Health checks:
  - `:checkhealth` (LSP, formatters, linters diagnostics)
  - `:LspInfo` (view LSP server status per buffer)
  - `:Mason` (verify all tools are installed)
  - `:messages` after reload to catch warnings/errors
- Headless quick load: `nvim --headless +qa` (basic sanity check).

## Environment Setup

- **Mason PATH**: All LSP servers and formatters must be in PATH:
  ```bash
  export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
  ```
  Add this to `~/.bashrc` and restart terminal for changes to take effect.

## Formatting

### Lua via Stylua

- Config: `stylua.toml` (2-space indent, max width 120).
- Format all Lua:
  ```bash
  stylua .
  ```
- In Neovim:
  ```vim
  Space + gf  (via conform.nvim)
  ```

### Multi-language via Conform

- **Plugin Spec**: `~/.config/nvim/lua/plugins/formatting.lua` (defines plugin and keybindings)
- **Options Config**: `~/.config/nvim/lua/configs/conform.lua` (defines formatters per language)
- Supported formatters:
  - **JavaScript/TypeScript/CSS/HTML**: `prettier`
  - **Python**: `black`
  - **C/C++**: `clang_format`
  - **Lua**: `stylua`
  - **Go**: `gofmt`
- Format current buffer in Neovim:
  ```vim
  Space + gf
  ```
- Inspect formatter setup:
  ```vim
  :ConformInfo
  ```

## LSP Setup

### Installed Servers

| Language | Server | Installed |
|----------|--------|-----------|
| HTML | html | ✅ |
| CSS | cssls | ✅ |
| TypeScript/Next.js | ts_ls | ✅ |
| TailwindCSS | tailwindcss | ✅ |
| C/C++ | clangd | ✅ |
| Go | gopls | ✅ |
| Python | pyright | ✅ |
| Docker | dockerls | ✅ |
| YAML | yamlls | ✅ |

### Installation via Mason

```vim
:Mason
# Search and press 'i' to install, or:
:MasonInstall <server-name>
```

### LSP Configuration

- File: `~/.config/nvim/lua/configs/lspconfig.lua`
- Add new server:
  ```lua
  local servers = {
    "ts_ls",
    "your-new-server",
  }
  vim.lsp.enable(servers)
  ```

### LSP Keybindings (NvChad defaults)

```
gd          → Go to definition
K           → Hover documentation
gi          → Go to implementation
Space + ca  → Code actions
Space + gf  → Format code (custom mapping in formatting.lua)
```

## Plugin Structure

- **Specs location**: `~/.config/nvim/lua/plugins/`
- **Each file returns a table** of plugin specs (lazy.nvim format).
- **Pattern**: One feature per file (e.g., `dashboard.lua`, `gitsigns.lua`).
- **Core plugins**:
  - `init.lua` — main plugin specs (LSP, Treesitter, etc.)
  - `dashboard.lua` — startup screen (dashboard-nvim)
  - `colorizer.lua` — inline color preview
  - `formatting.lua` — conform.nvim and mason-tool-installer setup
  - `gitsigns.lua` — git indicators
  - `toggleterm.lua` — floating terminal
  - `render-markdown.lua` — markdown preview
  - `rainbow-delimiters.lua` — bracket colorization
  - `snacks-nvim.lua` — UI utilities (indent guides, etc.)

## Config Files

- **chadrc.lua**: NvChad theme and UI settings.
- **configs/conform.lua**: Formatter configuration options.
- **configs/lspconfig.lua**: LSP servers setup.
- **configs/lazy.lua**: lazy.nvim settings.

## Code Structure and Conventions

- **Do not** manually require NvChad's autoloaded files:
  - Avoid requiring `nvchad.*` directly in most contexts; NvChad handles this.
- **Lua files**: 2-space indent, max width 120 characters.
- **Plugin specs**: Use `opts` or `config` function for setup.
- **Keep modules light**: Initialize side effects in setup functions, not at require time.

## Naming Conventions

- **Locals/fields**: `snake_case`
- **Modules/plugins**: follow plugin names or use `snake_case`
- **Files**: lowercase with hyphens (e.g., `nvim-colorizer`, `rainbow-delimiters`)
- **Functions**: `verb_noun` (e.g., `setup_lsp_servers`)
- **Keymaps**: use `Space` (leader) + intuitive letters (e.g., `Space + gf` for format)

## Error Handling and Logging

- **Wrap risky calls** with `pcall` or guard checks.
- **Fail fast** on hard misconfigurations; gracefully fallback for optional tools.
- **Notify via** `vim.notify()` with appropriate log levels.
- **Use `vim.schedule`** for notifications in callbacks or async contexts.
- **Check logs**: `:messages` or `~/.local/state/nvim/lsp.log`

## Tests and Validation

- No formal automated tests; validation is interactive:
  - `:source %` or restart; confirm no errors in `:messages`.
  - Run `:checkhealth` to verify LSP/formatters.
  - Open a file in each supported language and verify autocomplete works.
- **Manual checks per language**:
  - **TypeScript/Next.js**: Open `.tsx` file, hover over a function → see type info.
  - **Python**: Open `.py` file, type a function name → see autocomplete.
  - **Go**: Open `.go` file, press `gd` on a function → go to definition.
  - **C/C++**: Open `.c` or `.cpp` file, verify syntax highlighting via Treesitter.
  - **Tailwind**: Open `.jsx`/`.tsx`, type `className="flex` → see class suggestions.

## Treesitter Grammar Installation

- File: `~/.config/nvim/lua/plugins/init.lua`
- Ensure grammar list includes:
  ```lua
  ensure_installed = {
    "lua", "vimdoc", "vim",
    "html", "css", "typescript", "tsx", "javascript",
    "c", "cpp", "go", "python", "json", "yaml", "markdown",
  }
  ```
- Run `:TSUpdate` after adding new grammars.

## Git Workflow (with Gitsigns)

- **Gitsigns shows**:
  - `+` for added lines
  - `-` for deleted lines
  - `~` for modified lines
- **Config**: `~/.config/nvim/lua/plugins/gitsigns.lua`
- **Current line blame**: enabled (shows git blame on current line).

## Terminal Usage

- **Toggle floating terminal**:
  ```vim
  Space + `  (backtick)
  ```
- **In terminal mode**:
  ```
  Esc        → Normal mode
  i          → Insert mode
  ```

## Dashboard Customization

- File: `~/.config/nvim/lua/plugins/dashboard.lua`
- Uses `nvimdev/dashboard-nvim` with the `doom` theme.
- Change ASCII art in `config.header` table.
- Update buttons in `config.center` table with custom actions.

## Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| LSP not working | `:Mason`, verify server installed; check `:LspInfo` |
| Formatter not found | Verify in `~/.local/share/nvim/mason/bin/`; check `conform.lua` |
| Slow startup | Run `:Lazy` and check for errors; use `:Lazy profile` |
| Colors wrong | Check theme: `Space + th` (Telescope theme switcher) |
| Tailwindcss autocomplete not working | Verify `tailwindcss.config.js` exists in project root |

## Useful Commands (Cheat Sheet)

### In Neovim

```vim
Space + ff         → Find file
Space + fw         → Find word/grep
Space + e          → Toggle file explorer
Space + th         → Theme switcher
Space + gf         → Format code
Space + `          → Toggle terminal
:Mason             → Package manager
:Lazy              → Plugin manager
:LspInfo           → LSP status
:checkhealth       → Health check
:ConformInfo       → Formatter info
```

### In Terminal

```bash
# Verify Mason PATH
echo $PATH | grep mason

# Format Lua
stylua .

# Test a specific language
nvim test.go       # Test Go
nvim test.py       # Test Python
nvim test.jsx      # Test TypeScript/Tailwind
```

## File Map

```
~/.config/nvim/
├── init.lua                    # Entry point (loads NvChad v2.5)
├── lua/
│   ├── chadrc.lua             # NvChad theme/UI config
│   ├── configs/
│   │   ├── conform.lua        # Formatter settings (options)
│   │   ├── lspconfig.lua      # LSP servers setup
│   │   └── lazy.lua           # lazy.nvim settings
│   └── plugins/
│       ├── init.lua           # Core plugins (LSP, Treesitter)
│       ├── dashboard.lua      # Startup screen (dashboard-nvim)
│       ├── colorizer.lua      # Color preview
│       ├── formatting.lua     # Formatter plugin spec (conform.nvim)
│       ├── gitsigns.lua       # Git indicators
│       ├── toggleterm.lua     # Terminal
│       ├── render-markdown.lua # Markdown
│       ├── rainbow-delimiters.lua
│       └── snacks-nvim.lua
```

## Do and Do Not (Quick Reference)

- **Do**: Add Mason PATH to `~/.bashrc` and restart terminal.
- **Do**: Run `:Mason` to verify all tools are installed.
- **Do**: Use `:source %` for quick config reloads.
- **Do**: Test formatters in check mode before committing changes.
- **Do not**: Manually edit Mason-installed binaries.
- **Do not**: Ignore `:checkhealth` warnings.
- **Do not**: Add plugins without verifying they don't conflict with NvChad.

## Resources

- [NvChad Documentation](https://nvchad.com/)
- [NvChad GitHub](https://github.com/NvChad/NvChad)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Mason](https://github.com/williamboman/mason.nvim)

Maintain readability, clear organization, and explicit configuration across all contributions.
