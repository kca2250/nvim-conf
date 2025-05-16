-- lua/plugins/render-markdown.lua
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "codecompanion" },
  config = function()
    require("render-markdown").setup({
      -- デフォルト設定でも十分見やすい！
    })
  end
}

