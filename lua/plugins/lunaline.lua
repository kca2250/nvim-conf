return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン付きで表示する場合
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",  -- 他に "gruvbox", "tokyonight", "catppuccin" などもOK
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
              error = " ",
              warn  = " ",
              info  = " ",
              hint  = "󰌵 ",
            },
            colored = true,
            update_in_insert = true,
            always_visible = true,

          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
    })
  end,
}

