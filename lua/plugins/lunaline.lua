return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン付きで表示する場合
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",  -- 他に "gruvbox", "tokyonight", "catppuccin" などもOK
        section_separators = "", 
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = {
          {
          "diagnostics",
          sources = { "nvim_diagnostic" }, -- LSPベースの診断ソース
          sections = { "error", "warn", "info", "hint" },
          symbols = {
              error = "e:",
              warn  = "w:",
              info  = "i:",
              hint  = "h:",
            },
            colored = true,
            update_in_insert = true,
            always_visible = true,

          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_x = { "location" },
      }
    })
  end,
}

