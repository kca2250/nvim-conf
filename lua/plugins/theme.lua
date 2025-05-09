return {
  "folke/tokyonight.nvim",
  priority = 1000,        -- colorscheme は早めに読み込みたいときに
  config = function()
    require("tokyonight").setup({
      style = "storm",
      -- お好みで他オプションも追加
      transparent = true,
      terminal_colors = true,
      -- lualine_bold = true,
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
