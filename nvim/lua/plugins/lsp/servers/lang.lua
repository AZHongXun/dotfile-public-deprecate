-- Lsp Settings
return {
  astro = {},
  clangd = {
    capabilities = { offsetEncoding = "utf-16" },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion-decorators=false", -- prevent the mis-indented in cmp field
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = { usePlaceholders = true, completeUnimported = true, clangdFileStatus = true },
  },
  emmet_ls = {
    filetypes = { "html", "css", "less", "scss", "sass", "vue" },
  },
  cssls = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostic = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  },
  -- -- python
  pyright = {
    settings = {
      python = {
        disableOrganizeImports = false,
        analysis = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  -- -- tailwindcss
  tailwindcss = {
    filetypes = {
      "astro",
      "css",
      "html",
      "sass",
      "scss",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
    },
  },
  tsserver = {},
}
