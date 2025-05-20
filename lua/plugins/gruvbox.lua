return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      -- termguicolors をon（必要）
      vim.opt.termguicolors = true
      -- gruvbox のオプション
      require("gruvbox").setup({
        contrast = "hard",       -- "soft" | "medium" | "hard"
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        transparent_mode = true, -- 背景透過on
        dim_inactive = true,
        overrides = {
          signcolumn = { bg = "none" },  -- 行番号横のシンボル列を透過
          linenr = { fg = "#898989" },   -- 行番号の色
          floatborder = { fg = "#fabd2f" },
          vertsplit = { fg = "#504945" }, -- 分割線
          winseparator = { fg = "#fabd2f", bg = "none" }, -- 枠線
        }
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

