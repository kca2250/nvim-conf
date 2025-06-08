-- lua/plugins/monokai.lua
return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        terminal_colors = false,
        devicons = true,
        styles = {
          comment = { italic = true },
          keyword = { italic = true },
          type = { italic = true },
          storageclass = { italic = true },
          structure = { italic = true },
          parameter = { italic = true },
          annotation = { italic = true },
          tag_attribute = { italic = true },
        },
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        inc_search = "background", -- underline | background
        background_clear = {
          "toggleterm",
          "telescope",
          "renamer",
          "notify",
          "nvim-tree",
          "bufferline",
        },
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = "pro",
            context_start_underline = false,
          },
        },
      })

      vim.cmd("colorscheme monokai-pro")

      vim.cmd [[
        highlight NvimTreeNormal guibg=NONE ctermbg=NONE
        highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE
        highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
      ]]

      -- フロートウィンドウの枠線を見やすくする
      vim.cmd [[
        highlight FloatBorder guifg=#ffd700 guibg=NONE
      ]]

      -- チルダを非表示にする
      vim.opt.fillchars:append { eob = ' ' }  -- '~' → 空白にする方法
      vim.cmd [[ highlight EndOfBuffer guifg=NONE guibg=NONE ]]  -- ハイライトを透明に
    end,
  },
}
