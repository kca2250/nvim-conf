-- lua/plugins/hlchunk.lua
return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        style = {
          { fg = "#fabd2f" },
          { fg = "#C2C2C2" },
        },
        exclude_filetypes = {
          -- 除外したいfiletypeだけ指定。html/jsx/tsxは含めない！
          help = true,
          dashboard = true,
          markdown = true,
        },
      },
      indent = {
        enable = true,
        chars = { "." },
        style = {
          { fg = "#2e4053" },
        },
        exclude_filetypes = {
          help = true,
          dashboard = true,
          markdown = true,
        },
      },
      blank = {
        enable = true,
        chars = { "․" },
        style = {
          { fg = "#2e4053" },
        },
        exclude_filetypes = {
          help = true,
          dashboard = true,
          markdown = true,
        },
      },
    })
  end,
}

