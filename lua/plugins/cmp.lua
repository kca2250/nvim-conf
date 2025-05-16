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

    -- スニペット読み込みパス（VSCode風のスニペット対応）
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- 🔽 補完ポップアップ＆ドキュメント表示に枠をつける
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = {
        ["<S-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
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

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),

      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            buffer = "[Buf]",
            path   = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip  = "[Snip]",
            copilot  = "[]",
          })[entry.source.name]
          return vim_item
        end,
      },

      experimental = {
        ghost_text = true, -- 予測表示（仮想テキスト）
      },
    })
  end,
}

