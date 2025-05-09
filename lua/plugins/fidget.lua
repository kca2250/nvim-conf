return {
  "j-hui/fidget.nvim",
  tag = "legacy", -- ※安定版を使いたい場合はこれ、v1ではなくv1以前
  event = "VeryLazy", -- 遅延読み込み
  config = function()
    require("fidget").setup({
      text = {
        spinner = "dots", -- "dots", "line", "moon", "arc" など種類いろいろ
      },
      align = {
        bottom = true,
        right = true,
      },
      window = {
        blend = 0,
      },
    })
  end,
}

