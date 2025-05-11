-- lua/plugins/init.lua
local lazy = require("lazy")

lazy.setup({
  { import = "plugins.catppuccin" },         -- 🎨 カラースキーム
  { import = "plugins.nvim-web-devicons"},
  { import = "plugins.lunaline" },           -- 📊 ステータスライン（ちらつきやすい）
  { import = "plugins.colorizer" },          -- 🎨 色表示系も早めに
  { import = "plugins.neo-tree" },           -- 🗂️ サイドバー
  { import = "plugins.telescope" },          -- 🔭 ファジーファインダ
  { import = "plugins.lazygit" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.treesitter" },
  { import = "plugins.treesitter-context"},
  { import = "plugins.toggleterm" },
  { import = "plugins.autopairs" },
  { import = "plugins.emmet" },
  { import = "plugins.octo" },
  { import = "plugins.dropbar" },
  { import = "plugins.tiny-inline-diagnostic" },
  { import = "plugins.comment"},
  { import = "plugins.conform"}
})

