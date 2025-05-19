-- lua/plugins/lualine.lua
local clock = ""

-- ⏱ 時計を1秒ごとに更新するタイマー
local function update_clock()
  clock = os.date("%H:%M:%S")
  vim.schedule(function()
    vim.cmd("redrawstatus")
  end)
  vim.defer_fn(update_clock, 1000) -- 毎秒繰り返す
end

update_clock() -- 最初の起動

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン付きで表示する場合
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",  -- 他に "gruvbox", "tokyonight", "catppuccin" などもOK
        section_separators = "", 
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          {
            "filename",
            symbols = {
              readonly = " ",
              unnamed = "[No Name]",
            },
            color = function()
              if vim.bo.modified then
                return { fg = "#ffffff", bg = "#ff5f5f", gui = "bold" } -- 🔥未保存時
              else
                return { fg = "#ffffff", bg = "#23c191" }               -- 💾保存済み
              end
            end,
          },
        },
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
          {
            "filetype",
            colored = true,
            icon = {
              align = "right", -- アイコンを右寄せにする
            },
          },
        },
        lualine_y = {
          {
            function()
              return clock
            end,
            color = { fg = "#ffffff", bg = "#3888a2" }, -- 色を指定する場合
          },
        },
        lualine_z = { "" },
      }
    })
  end,
}

