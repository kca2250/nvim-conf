-- lua/plugins/cmp.lua
-- ──────────────────────────────────────────────────────────────────────────────
-- nvim-cmp: Neovim の補完エンジンとソースの設定
-- ──────────────────────────────────────────────────────────────────────────────
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",    -- LSP 連携ソース
    "hrsh7th/cmp-buffer",      -- バッファ内補完
    "hrsh7th/cmp-path",        -- ファイルパス補完
    "saadparwaiz1/cmp_luasnip",-- LuaSnip 連携ソース
    "L3MON4D3/LuaSnip",        -- スニペットエンジン
  },
  event = "InsertEnter",      -- 挿入モードに入ったら読み込む
  
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- スニペット読み込みパス（optional）
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<S-Space>"] = cmp.mapping.complete(),           -- 補完開始
        ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- Enter で確定
        ["<Tab>"]     = cmp.mapping(function(fallback)    -- Tab で選択 or スニペット展開
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"]   = cmp.mapping(function(fallback)    -- Shift-Tab で前の候補 or スニペットジャンプ
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
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = 'copilot'},
        { name = "path" },
      }),
      formatting = {
        format = function(entry, vim_item)
          -- アイコン表示（optional）
          vim_item.menu = ({
            buffer = "[Buf]",
            path   = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip  = "[Snip]",
          })[entry.source.name]
          return vim_item
        end,
      },
      experimental = {
        ghost_text = true,  -- 予測テキストを表示
      },
    })
  end,
}
