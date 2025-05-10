## Neovim Configuration

This project is a comprehensive setup for Neovim, leveraging modern plugin management and configuration written in Lua to enhance the Neovim experience. The setup provides a scalable and efficient environment for code editing.

### Project Structure

- **init.lua**: Entry point for the Neovim configuration. It initializes core settings and loads plugins.
- **lua/core/**: Contains core configurations including options, key mappings, and autocommands.
  - **options.lua**: Defines Neovim options like number line visibility, tab settings, and clipboard integration.
  - **keymaps.lua**: Custom key mappings for improved workflow.
  - **autocmds.lua**: Autocommands for event-driven scripting.
- **lua/plugins/**: Contains individual plugin configurations.
  - **init.lua**: Manages plugin loading via the `lazy` plugin manager. Lists all plugins and their configuration files.

### Key Features

- **Plugin Management**: Uses lazy loading to efficiently manage plugins, ensuring a quick startup time while keeping numerous features available.
- **Enhanced UI**: Includes themes like `catppuccin`, statusline improvements with `lunaline`, and color enhancements with `colorizer`.
- **Code Editing**: Integrations with `treesitter` for syntax highlighting and structured editing, `lsp` for language server protocol support, and `cmp` for auto-completion.
- **Version Control**: Utilizes `lazygit` and `octo` for git and GitHub integration within Neovim.
- **Productivity Tools**: Includes `toggleterm` for terminal management, `neo-tree` for file navigation, and `fidget` for LSP progress notifications.

### Usage Instructions

1. **Installation**: Clone the repo into your Neovim configuration directory, typically `~/.config/nvim`.
2. **Initialize Plugins**: Run `:Lazy install` in Neovim to install all necessary plugins.
3. **Customize**: Adjust configuration files in `lua/core` and `lua/plugins` as desired to suit your personal workflows.

This setup aims to provide a powerful yet intuitive environment for coding within Neovim, leveraging the latest in plugin ecosystems and custom configurations to maximize productivity and efficiency.


