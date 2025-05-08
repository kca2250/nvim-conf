-- lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "BufWinEnter",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal",             -- バッファに番号を表示
        diagnostics = "nvim_lsp",        -- LSP エラー数
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",       -- セパレータスタイル
        always_show_bufferline = true,   -- 常に表示
      },
    })
  end,
}
