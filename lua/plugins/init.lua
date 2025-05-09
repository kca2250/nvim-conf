-- lua/plugins/init.lua
local lazy = require("lazy")

lazy.setup({
  { import = "plugins.telescope" },
  { import = "plugins.lazygit" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.treesitter" },
  { import = "plugins.catppuccin" },
  { import = "plugins.neo-tree" },
  { import = "plugins.toggleterm" },
  { import = "plugins.lunaline" },
  { import = "plugins.colorizer" },
  { import = "plugins.autopairs" },
  { import = "plugins.emmet" },
  { import = "plugins.code-companion" },
  { import = "plugins.fidget"},
  { import = "plugins.conform"},
  { import = "plugins.copilot"},
  { import = "plugins.octo" }
})
