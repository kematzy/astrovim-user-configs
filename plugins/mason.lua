-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "bashls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "emmet_ls",
        "graphql",
        "html",
        "jsonls",
        "quick_lint_js", -- JavaScript
        -- "phpactor", -- PHP
        "intelephense", -- PHP
        -- "psalm", -- PHP
        "pest_ls",
        "prismals",
        "ruby_ls",
        "sqlls",
        "svelte",
        "tailwindcss",
        "tsserver", -- TypeScript
        "volar", -- vue
        "lemminx", -- XML
        "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- FORMATTERS
        "prettier",
        "stylua",
        -- LINTERS
        "rubocop",
        -- "phpstan",
        -- "phpcs",
        -- "phpmd",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}
