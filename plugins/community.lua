return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
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
}
