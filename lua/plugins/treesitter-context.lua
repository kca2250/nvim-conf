return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesitter-context").setup({
      enable = true,            -- contextを有効にする
      max_lines = 3,            -- 表示する最大行数（0は制限なし）
      trim_scope = "outer",     -- 長すぎるときのスコープ削除方向
      mode = "cursor",          -- "cursor" | "topline"：どの位置でcontext表示するか
      separator = "─",          -- 本体とcontextの区切り線
      zindex = 20,              -- 表示順（UIレイヤー）
    })
  end,
}

