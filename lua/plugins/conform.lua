-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        -- 必要な言語を追加してね！
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- LSPフォーマッタが無ければformatterを使う
      },
    })
  end,
}

