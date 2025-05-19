-- lua/plugins/init.lua
local lazy = require("lazy")

lazy.setup({
  { import = "plugins.gruvbox"},
  { import = "plugins.nvim-web-devicons"},
  { import = "plugins.lunaline" },           -- 📊 ステータスライン（ちらつきやすい）
  { import = "plugins.colorizer" },          -- 🎨 色表示系も早めに
  { import = "plugins.nvim-tree" },           -- 🗂️ サイドバー
  { import = "plugins.dressing"},
  { import = "plugins.noice"},
  { import = "plugins.hlchunk"},
  { import = "plugins.telescope" },          -- 🔭 ファジーファインダ
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
  { import = "plugins.codecompanion"},
  { import = "plugins.mcphub"},
  { import = "plugins.surround"},
  { import = "plugins.gitsigns"}
})

