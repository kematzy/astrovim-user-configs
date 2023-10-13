-- KEMATZY DEV CONFIGURATIONS:
-- A collection of configurations for a better development experience.
--
-- Note: much of the code is taken from the AstroNvim Community project code.
-- See: https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity

-- Packs copied:
-- { import = "astrocommunity.pack.bash" },
-- { import = "astrocommunity.pack.docker" },
-- { import = "astrocommunity.pack.go" },
-- { import = "astrocommunity.pack.html" },
-- { import = "astrocommunity.pack.json" },
-- { import = "astrocommunity.pack.markdown" },
-- { import = "astrocommunity.pack.php" },
-- { import = "astrocommunity.pack.prisma" },
-- { import = "astrocommunity.pack.ruby" },
-- { import = "astrocommunity.pack.tailwindcss" },
-- { import = "astrocommunity.pack.svelte" },
-- { import = "astrocommunity.pack.toml" },
-- { import = "astrocommunity.pack.typescript" },
-- { import = "astrocommunity.pack.vue" },
-- { import = "astrocommunity.pack.yaml" },

local utils = require "astronvim.utils"

-- Treesitter parsers to be added
local my_nvim_treesitters = {
  "bash", -- Bash pack
  "json",
  "jsonc", -- JSON pack
  "html",
  "css", -- HTML & CSS pack
  "javascript", -- Typescript pack
  "typescript", -- Typescript pack
  "tsx", -- Typescript pack
  "svelte", -- Svelte pack
  "vue", -- Vue pack
  "prisma", -- Prisma pack
  "php", -- PHP pack
  "ruby", -- Ruby pack
  "markdown", -- Markdown pack
  "markdown_inline", -- Markdown pack
  -- "go", -- Go pack
  -- "gomod", -- Go pack
  -- "gosum", -- Go pack
  -- "gowork", -- Go pack
  "yaml", -- YAML pack,
  "dockerfile", -- Docker pack
  "lua", -- Lua pack
  "luap", -- Lua pack
}

-- Mason LSP language servers to be added
local my_mason_lspconfigs = {
  "bashls", -- Bash pack,
  "jsonls", -- JSON pack
  "html",
  "cssls",
  "emmet_ls", -- HTML & CSS pack
  "tsserver", -- Typescript pack
  "tailwindcss", -- TailwindCSS pack
  "svelte", -- Svelte pack
  "volar", -- Vue pack
  "prismals", -- Prisma pack
  "phpactor", -- PHP pack
  "solargraph", -- Ruby pack
  "marksman", -- Markdown pack
  -- "gopls", -- Go pack
  "yamlls", -- YAML pack
  "taplo", -- TOML pack
  "docker_compose_language_service", -- Docker pack
  "dockerls", -- Docker pack
  "lua_ls", -- Lua pack
}

-- Mason Null-ls formatters to be added
local my_mason_null_ls = {
  "prettierd", -- Markdown, TailwindCSS, Typescript & YAML Pack,
  "shellcheck", -- Bash pack
  "shfmt", -- Bash pack
  "eslint-lsp", -- Typescript pack
  "php-cs-fixer", -- PHP pack
  "standardrb", -- Ruby pack
  "hadolint", -- Docker pack
  "stylua", -- Lua pack
  "luacheck", -- Lua pack
  -- "gomodifytags", -- Go pack
  -- "gofumpt", -- Go pack
  -- "iferr", -- Go pack
  -- "impl", -- Go pack
  -- "goimports", -- Go pack
}

-- Mason DAP debugging adapters to be added
local my_mason_nvim_daps = {
  "bash", -- Bash pack
  "js", -- (js-debug-adapter) Svelte, Typescript & Vue pack
  "php", -- PHP pack
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, my_nvim_treesitters)
      end
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, my_mason_lspconfigs)
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, my_mason_null_ls)
      -- Ensure that opts.handlers exists and is a table (Typescript & TOML)
      if not opts.handlers then opts.handlers = {} end

      -- TOML pack
      opts.handlers.taplo = function() end

      -- Typescript pack
      local function check_json_key_exists(filename, key)
        -- Open the file in read mode
        local file = io.open(filename, "r")
        if not file then
          return false -- File doesn't exist or cannot be opened
        end

        -- Read the contents of the file
        local content = file:read "*all"
        file:close()

        -- Parse the JSON content
        local json_parsed, json = pcall(vim.fn.json_decode, content)
        if not json_parsed or type(json) ~= "table" then
          return false -- Invalid JSON format
        end

        -- Check if the key exists in the JSON object
        return json[key] ~= nil
      end

      local has_prettier = function(util)
        return check_json_key_exists(vim.fn.getcwd() .. "/package.json", "prettier")
          or util.root_has_file ".prettierrc"
          or util.root_has_file ".prettierrc.json"
          or util.root_has_file ".prettierrc.yml"
          or util.root_has_file ".prettierrc.yaml"
          or util.root_has_file ".prettierrc.json5"
          or util.root_has_file ".prettierrc.js"
          or util.root_has_file ".prettierrc.cjs"
          or util.root_has_file "prettier.config.js"
          or util.root_has_file "prettier.config.cjs"
          or util.root_has_file ".prettierrc.toml"
      end

      opts.handlers.prettierd = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with { condition = has_prettier })
      end
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, my_mason_nvim_daps)
    end,
  },

  -- Go pack additions
  -- {
  --   {
  --     "leoluz/nvim-dap-go",
  --     ft = "go",
  --     dependencies = {
  --       "mfussenegger/nvim-dap",
  --       {
  --         "jay-babu/mason-nvim-dap.nvim",
  --         opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "delve") end,
  --       },
  --     },
  --     opts = {},
  --   },
  --   {
  --     "ray-x/go.nvim",
  --     dependencies = {
  --       "ray-x/guihua.lua",
  --       "neovim/nvim-lspconfig",
  --       "nvim-treesitter/nvim-treesitter",
  --     },
  --     opts = {},
  --     event = { "CmdlineEnter" },
  --     ft = { "go", "gomod" },
  --     build = ':lua require("go.install").update_all_sync()',
  --   },
  -- },
  -- /Go

  -- Ruby pack additions
  {
    {
      "mfussenegger/nvim-dap",
      dependencies = { "suketa/nvim-dap-ruby", config = true },
    },
  },

  -- TailwindCSS pack addtions
  {
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        { "js-everts/cmp-tailwind-colors", opts = {} },
      },
      opts = function(_, opts)
        local format_kinds = opts.formatting.format
        opts.formatting.format = function(entry, item)
          if item.kind == "Color" then
            item = require("cmp-tailwind-colors").format(entry, item)
            if item.kind == "Color" then return format_kinds(entry, item) end
            return item
          end
          return format_kinds(entry, item)
        end
      end,
    },
    {
      "NvChad/nvim-colorizer.lua",
      opts = {
        user_default_options = {
          names = true,
          tailwind = true,
        },
      },
    },
  },
  -- /TailwindCSS

  -- Typescript pack additions
  {
    {
      "vuki656/package-info.nvim",
      dependencies = { "MunifTanjim/nui.nvim" },
      opts = {},
      event = "BufRead package.json",
    },
    {
      "jose-elias-alvarez/typescript.nvim",
      init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver") end,
      ft = {
        "typescript",
        -- "typescriptreact",
        "javascript",
        -- "javascriptreact",
      },
      opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, opts)
        opts.sources = utils.list_insert_unique(opts.sources, require "typescript.extensions.null-ls.code-actions")
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = function(_, opts)
        local events = require "neo-tree.events"

        local function on_file_remove(args)
          local ts_clients = vim.lsp.get_active_clients { name = "tsserver" }
          for _, ts_client in ipairs(ts_clients) do
            ts_client.request("workspace/executeCommand", {
              command = "_typescript.applyRenameFile",
              arguments = {
                {
                  sourceUri = vim.uri_from_fname(args.source),
                  targetUri = vim.uri_from_fname(args.destination),
                },
              },
            })
          end
        end

        opts.event_handlers = {
          {
            event = events.FILE_MOVED,
            handler = on_file_remove,
          },
          {
            event = events.FILE_RENAMED,
            handler = on_file_remove,
          },
        }
      end,
    },
    {
      "dmmulroy/tsc.nvim",
      cmd = { "TSC" },
      opts = {},
    },
  },
  -- /Typescript
}
