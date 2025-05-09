-- lua/plugins/emmet.lua
return {
  "mattn/emmet-vim",
  ft = { "html", "javascriptreact", "typescriptreact", "vue", "razor" },
  config = function()
    -- グローバルインストールオフ
    vim.g.user_emmet_install_global = 0

    -- １行で書く（スペースや改行なし）
    vim.cmd([[
      autocmd FileType html,xml,xhtml,css,javascriptreact,typescriptreact,vue,razor EmmetInstall
    ]])

    -- 展開キー
    vim.api.nvim_set_keymap("i", "<C-e>", "<Plug>(emmet-expand-abbr)", { silent = true })
  end,
}

