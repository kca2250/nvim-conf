-- lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",   -- TypeScript / JavaScript
          "html",       -- HTML
          "cssls",      -- CSS / SCSS / Sass
          "jsonls",     -- JSON（おまけ）
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- 補完連携用（任意）
    },
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        local buf_map = function(mode, lhs, rhs)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
        end
        -- ジャンプ系
        buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        -- アクション系
        buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- TypeScript / JavaScript
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- HTML
      lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- CSS / SCSS / Sass
      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "css", "scss", "sass" },
        settings = {
          css = { validate = true },
          scss = { validate = true },
          sass = { validate = true },
        },
      })

      -- JSON
      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })


      -- eslint
      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

    end,
  },
}

