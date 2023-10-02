return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  -- {
  --   "catppuccin.nvim",
  --   opts = {},
  -- },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  {
    "zen-mode.nvim",
    opts = {
      window = {
        options = {
          signcolumn = "yes",
          list = true,
        },
      },
      plugins = {
        gitsigns = { enabled = true },
        -- kitty
        kitty = {
          enabled = true,
          font = "+6", -- font size increment
        },
      },
    },
  },

  -- Adds better command line functionality and notifications
  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/utility/noice-nvim
  { import = "astrocommunity.utility.noice-nvim" },

  {
    -- You can toggle git blame messages on/off with the :GitBlameToggle command.
    import = "astrocommunity.git.git-blame-nvim",
    -- See: https://github.com/f-person/git-blame.nvim for configurations
  },

  -- Dim inactive portions of the code you are editing.
  -- See: https://github.com/folke/twilight.nvim
  { import = "astrocommunity.color.twilight-nvim" },
}
