-- lua/plugins/init.lua
local lazy = require("lazy")

lazy.setup({
  { import = "plugins.telescope" },
  { import = "plugins.lazygit" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.treesitter" },
  { import = "plugins.treesitter-context"},
  { import = "plugins.catppuccin" },
  { import = "plugins.neo-tree" },
  { import = "plugins.toggleterm" },
  { import = "plugins.lunaline" },
  { import = "plugins.colorizer" },
  { import = "plugins.autopairs" },
  { import = "plugins.emmet" },
  { import = "plugins.fidget"},
  { import = "plugins.octo" },
  { import = "plugins.dropbar" },
  { import = "plugins.tiny-inline-diagnostic" },
  { import = "plugins.comment"},
  { import = "plugins.conform"}
})

