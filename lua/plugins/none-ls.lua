return {
  "nvimtools/none-ls.nvim", -- ← これが正式名称！
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  config = function()
    require("plugins.none-ls") -- ← ここで設定ファイルを読み込んでる
  end,
}
