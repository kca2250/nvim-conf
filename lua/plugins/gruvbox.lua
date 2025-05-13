return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      -- termguicolors をON（必要）
      vim.opt.termguicolors = true

      -- Gruvbox のオプション
      require("gruvbox").setup({
        contrast = "soft",       -- "soft" | "medium" | "hard"
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        transparent_mode = true, -- 背景透過ON
        dim_inactive = true,
        overrides = {
          SignColumn = { bg = "none" },  -- 行番号横のシンボル列を透過
          LineNr = { fg = "#c1c1c1" },   -- 行番号の色
          CursorLineNr = { fg = "#fe1296", bold = true }, -- 現在行の行番号
          FloatBorder = { fg = "#fabd2f" },
          VertSplit = { fg = "#504945" }, -- 分割線
          WinSeparator = { fg = "#fabd2f", bg = "none" }, -- 枠線
        }

      })

      vim.cmd("colorscheme gruvbox")
    end,
  },
}

