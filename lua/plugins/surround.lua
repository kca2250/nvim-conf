-- lua/plugins/surround.lua
return {
  "kylechui/nvim-surround",
  version = "*", -- 安定版を使う
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      surrounds = {
        ["t"] = {
          add = function()
            local tag = vim.fn.input("Tag: ")
            return { { "<" .. tag .. ">" }, { "</" .. tag .. ">" } }
          end,
        },
      },
    })
  end
}
