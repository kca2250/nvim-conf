-- lua/plugins/autopairs.lua
return {
  -- nvim-autopairs 本体
  {
    "windwp/nvim-autopairs",
   event = "InsertEnter",       -- 挿入モードに入ったとき読み込む
    dependencies = {
      -- Treesitter（必須）
      "nvim-treesitter/nvim-treesitter",
      -- タグ自動クローズ用プラグイン
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- まず nvim-autopairs をセットアップ
      require("nvim-autopairs").setup{}

      -- 次に nvim-ts-autotag をセットアップ
      require("nvim-ts-autotag").setup{
        filetypes = { "html", "xml", "typescriptreact", "javascriptreact", "vue" },
      }
    end,
  },
}

