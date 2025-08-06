local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
  map("n", "gr", vim.lsp.buf.references, "List References")
  map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
  map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
  map("n", "go", vim.lsp.buf.type_definition, "Go to Type Definition")
  map("n", "gs", vim.lsp.buf.signature_help, "Signature Help")
  map("n", "<F2>", vim.lsp.buf.rename, "Rename Symbol")
  map({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, "Format")
  map("n", "<F4>", vim.lsp.buf.code_action, "Code Action")
end


return {

  -- Mason: LSP/DAP installer
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Mason bridge for lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = true,
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        -- tsserver changed to ts_ls
        ensure_installed = { "pyright", "ts_ls", "html", "cssls", "tailwindcss", "emmet_ls" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,
        },
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        }
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        before_init = function(_, config)
          config.settings = {
            python = {
              pythonPath = vim.fn.expand("$HOME/miniconda3/envs/ml/bin/python3")
            }
          }
        end,
      })
    end,
  },

  -- CMP: Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }
      })
    end,
  },
}

