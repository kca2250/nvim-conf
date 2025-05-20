return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter", -- Treesitterと連携できる！
  },
  event = "BufReadPost",
  config = function()
    vim.o.foldcolumn = "1" -- 折りたたみインジケータ表示
    vim.o.foldlevel = 99   -- デフォルトで全て開く
    vim.o.foldenable = true
    vim.o.foldlevelstart = 99

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" } -- fallback可
      end,
    })
  end,
}
