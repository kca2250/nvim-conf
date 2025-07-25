-- lua/plugins/init.lua
local lazy = require("lazy")

lazy.setup({
  { import = "plugins.monokai"},
  { import = "plugins.nvim-web-devicons"},
  { import = "plugins.lunaline" },
  { import = "plugins.colorizer" },
  { import = "plugins.nvim-tree" },
  { import = "plugins.which-key" },
  { import = "plugins.todo-comment"},
  { import = "plugins.dressing"},
  { import = "plugins.noice"},
  { import = "plugins.hlchunk"},
  { import = "plugins.toggleterm"},
  { import = "plugins.telescope" },
  { import = "plugins.lazygit" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.tailwindcolor"},
  { import = "plugins.render-markdown"},
  { import = "plugins.copilot"},
  { import = "plugins.copilot-cmp"},
  { import = "plugins.treesitter" },
  { import = "plugins.treesitter-context"},
  { import = "plugins.autopairs" },
  { import = "plugins.emmet" },
  { import = "plugins.octo" },
  { import = "plugins.dropbar" },
  { import = "plugins.tiny-inline-diagnostic" },
  { import = "plugins.comment"},
  { import = "plugins.conform"},
  { import = "plugins.surround"},
  { import = "plugins.gitsigns"},
  { import = "plugins.nvim-ufo"},
  { import = "plugins.vim-visual-multi"}
})

