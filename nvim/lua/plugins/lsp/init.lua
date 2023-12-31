return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      diagnostic = {
        virtual_text = {
          prefix = "●",
        },
        update_in_insert = false,
        float = {
          source = "always", -- Or "if_many"
          prefix = function(diag)
            local severity = vim.diagnostic.severity[diag.severity]
            return string.format(" %s ", require("util.icons").diagnostic_signs[severity]),
                "Diagnostic" .. severity
          end,
        },
        severity_sort = true,
        underline = true,
      },
    },
    config = function(_, opts)
      -- local lspconfig = require("lspconfig")
      -- Diagnostic symbols in the sign column (gutter)
      local diagnostic_signs = require("util.icons").diagnostic_signs
      for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostic)

      -- Set up completion using nvim_cmp with LSP source
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = require("util.lsp").on_attach()

      local servers = require("plugins.lsp.servers.lang")
      for server, options in pairs(servers) do
        opts.capabilities = capabilities
        opts.on_attach = on_attach
        require("lspconfig")[server].setup(options)
      end
    end,
  },
  { -- Better UI for LSP
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          winblend = 10,
          border = "rounded",
          colors = {
            normal_bg = "#002b36",
          },
        },
        lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
  }

}
