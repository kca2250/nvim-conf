-- lua/plugins/render-markdown.lua
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "codecompanion" },
  config = function()
    require("render-markdown").setup({
      headings = {
        position = "inline",
        widht = "block",
        border = true,
        border_virtual = true,
        heading_styles = { "Function", "Conditional", "Repeat", "String", "Identifier", "Comment" },
      },
      bullets = {
        symbol = "▸",
        highlight = "Keyword",
      },
      quote = {
        highlight = "Comment",
        string_char = "┃",
      },
      code = {
        highlight = "Normal",
        background = true,
      },
      italic = {
        highlight = "Comment",
      },
      bold = {
        highlight = "Statement",
      },
    })
  end
}

