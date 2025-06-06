-- lua/plugins/monokai.lua
return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = false,
        terminal_colors = true,
        devicons = true,
        styles = {
          comments = { italic = true },
          functions = { bold = true },
          keywords = { italic = true },
          strings = { italic = true },
        },
        filter = "octagon",
      })

      vim.cmd("colorscheme monokai-pro")

      -- NvimTree の背景を透明に
      vim.cmd [[
        highlight NvimTreeNormal guibg=NONE ctermbg=NONE
        highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE
        highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
      ]]

      -- フロートウィンドウの枠線を見やすくする
      vim.cmd [[
        highlight FloatBorder guifg=#ffd700 guibg=NONE
      ]]
    end,
  },
}
