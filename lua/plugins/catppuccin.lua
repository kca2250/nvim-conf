-- lua/plugins/catppuccin.lua
return {
  "catppuccin/nvim",
  name = "catppuccin", -- 色の指定に使う
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      integrations = {
        treesitter = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        notify = true,
        mini = true,
        which_key = true,
        fidget = true,
        markdown = true,
        noice = true,
        -- 他にも lualine など対応多数！
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

