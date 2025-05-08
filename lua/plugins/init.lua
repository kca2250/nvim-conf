-- lua/plugins/init.lua
local lazy = require("lazy")

lazy.setup({
  { import = "plugins.telescope" },
  { import = "plugins.lazygit" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.treesitter" },
  { import = "plugins.theme" },
  { import = "plugins.neo-tree" },
  { import = "plugins.toggleterm" },
  { import = "plugins.code-companion" },
  { import = "plugins.lunaline" },
}) 
