-- lua/plugins/treesitter.lua
-- ────────────────────────────────────────────────────────────────
-- nvim-treesitter: 高速で正確な構文ハイライト & コード解析
-- ────────────────────────────────────────────────────────────────
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",            -- 起動時に Parsers を自動更新
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {         -- 必要な言語を列挙
        "javascript",
        "typescript",
        "ruby",
        "html",
        "css",
        "scss",
        "json",
      },
      highlight = {
        enable = true,             -- シンタックスハイライト有効化
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,             -- 自動インデント
      },
      incremental_selection = {
        enable = true,             -- 選択範囲拡張
        keymaps = {
          init_selection = "gnn",  -- 選択開始
          node_incremental = "grn",-- 範囲を広げる
          node_decremental = "grm",-- 範囲を狭める
        },
      },
      playground = {
        enable = false,            -- Tree-sitter Playground（必要なら true）
      },
    })
  end,
}
