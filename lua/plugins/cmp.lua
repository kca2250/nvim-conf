-- lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",    -- LSP 連携ソース
    "hrsh7th/cmp-buffer",      -- バッファ内補完
    "hrsh7th/cmp-path",        -- ファイルパス補完
    "saadparwaiz1/cmp_luasnip",-- LuaSnip 連携ソース
    "L3MON4D3/LuaSnip",        -- スニペットエンジン
  },
  event = "InsertEnter",

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- VSCode風スニペットの読み込み
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = {
        ["<S-Space>"] = cmp.mapping.complete(),

        -- ✅ 明示的に選択された候補だけ確定（Enterで勝手に確定されない）
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      -- 🔽 Copilot のソースは後ろに（優先度を下げる）
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
        { name = "copilot" }, -- Ghost Text は出るけど勝手に確定されない
      }),

      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            buffer   = "[Buf]",
            path     = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip  = "[Snip]",
            copilot  = "[]",
          })[entry.source.name]
          return vim_item
        end,
      },

      experimental = {
        ghost_text = false, -- 👻 提案をゴースト表示（入力はされない）
      },
    })
  end,
}
