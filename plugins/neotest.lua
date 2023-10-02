return {
  {
    "nvim-neotest/neotest",
    ft = { "go", "rust", "python" },
    dependencies = {
      "marilari88/neotest-vitest",
      "theutz/neotest-pest",
      "olimorris/neotest-phpunit",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
      "thenbe/neotest-playwright",
      -- "nvim-neotest/neotest-go",
      -- "nvim-neotest/neotest-python",
      -- "rouge8/neotest-rust",
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astronvim.utils").list_insert_unique(opts.library.plugins, "neotest")
          end
          opts.library.types = true
        end,
      },
    },
    opts = function()
      return {
        -- your neotest config here
        adapters = {
          require "neotest-vitest",
          require "neotest-pest" {
            pest_cmd = function() return "vendor/bin/pest" end,
            root_files = { "composer.json", ".gitignore", "tests/Pest.php" },
            filter_dirs = { ".git", "node_modules" },
          },
          require "neotest-phpunit",
          require "neotest-rspec",
          require "neotest-minitest",
          require "neotest-playwright",
          -- require "neotest-go",
          -- require "neotest-rust",
          -- require "neotest-python",
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { neotest = true } },
  },
}
