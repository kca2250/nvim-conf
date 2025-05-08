-- lua/plugins/tokyonight.lua
return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night", -- storm, night, day
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight]])
  end,
}
