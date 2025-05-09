
--保存時に Quickfix を自動更新する 
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    local diagnostics = vim.diagnostic.get(0) -- 現在バッファの診断情報を取得
    if #diagnostics > 0 then
      vim.diagnostic.setqflist({ open = false }) -- Quickfixにセット（開きはしない）
    end
  end,
})

-- Prettierの状態を表示させておく
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    local conform = require("conform")

    -- 現在のバッファにformatterが設定されていればPrettier実行済とみなす
    local filetype = vim.bo.filetype
    local formatters = conform.list_formatters_for_buffer(0)
    local used_prettier = vim.tbl_contains(formatters, "prettier")

    if used_prettier then
      vim.g.prettier_status = "✓"
    else
      vim.g.prettier_status = "x"
    end
  end,
})
