-- ~/.config/nvim/lua/plugins.lua
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup(
      -- カラライズしたいファイルタイプのリスト
      {
        "*",        -- すべてのバッファ
        "!vim",     -- ただし vim スクリプトは除外
      },
      {
        RGB      = true,         -- #RGB をカラー表示
        RRGGBB   = true,         -- #RRGGBB をカラー表示
        names    = true,         -- CSS カラー名 (e.g. "Blue") を表示
        RRGGBBAA = true,         -- #RRGGBBAA を表示
        css      = true,         -- all CSS 専用ルールを有効
        css_fn   = true,         -- CSS 関数 (rgb(), hsl()) も
      }
    )
  end,
}

