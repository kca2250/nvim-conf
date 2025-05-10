-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "",
        selection_caret = " ",
        mappings = {
          i = {
            ["<Esc>"] = require("telescope.actions").close,
          },
        },
      },
    })
  end,
}
