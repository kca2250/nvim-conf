-- lua/plugins/treesitter.lua
-- ────────────────────────────────────────────────────────────────
-- nvim-treesitter: 高速で正確な構文ハイライト & コード解析
-- ────────────────────────────────────────────────────────────────
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "dockerfile",
        "javascript",
        "typescript",
        "ruby",
        "astro",
        "html",
        "css",
        "scss",
        "tsx",
        "json",
        "yaml",
        "lua",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
        },
      },
      playground = {
        enable = false,
      },
    })

    -- 💡 typescriptreact に tsx パーサーを使うように設定
    if vim.treesitter.language.register then
      vim.treesitter.language.register("tsx", "typescriptreact")
    end
  end,
}

