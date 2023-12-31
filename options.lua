-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- add support for showing hidden whitespace characters
    -- toggle for on/off status
    list = true,

    -- Characters used to visually show hidden characters
    listchars = {
      -- Two or three characters to be used to show a tab. The third character is optional.
      tab = "→ ",
      -- Character to show at the end of each line.
      -- When omitted, there is no extra character at the end of the line.
      eol = "↲",
      -- Character to show for a non-breakable space character
      nbsp = "␣",
      -- Character to show for a space.
      space = "·",
      -- Character to show for leading spaces.
      lead = "·",
      -- Character to show for trailing spaces.
      trail = "•",
      -- Character to show in the last column, when 'wrap' is off and
      -- the line continues beyond the right of the screen.
      extends = "⟩",
      -- Character to show in the first visible column of the physical line,
      -- when there is text preceding the character visible in the first column.
      precedes = "⟨",
    },

    -- String to put at the start of lines that have been wrapped.
    showbreak = "↪ ",

    -- specifies the number of spaces or columns that the cursor will move when you press the Tab key,
    -- even if you're using actual tab characters (\t) for indentation.
    -- Useful for consistent cursor movement and alignment when using tabs for indentation.
    softtabstop = 2,

    -- not set in defaults
    spell = false, -- sets vim.opt.spell

    -- Maximum width of text that is being inserted. A longer line will be broken after whitespace to get the width.
    -- A zero value disables this.
    textwidth = 120,

    -- =============================================================================
    -- Overrides of default options set in ~/.config/nvim/lua/astronvim/options.lua
    -- =============================================================================

    signcolumn = "yes:1", -- avoid page movement, keep Gitsign column fixed

    -- Enable wrapping of lines longer than the width of window
    wrap = true, -- sets vim.opt.wrap

    -- Specifies the number of columns that a tab character should occupy when displayed.
    -- It determines how many spaces are used for each tab when you press the Tab key.
    -- tabstop = 2,

    -- Specifies the number of spaces to be used for each level of indentation
    -- when using soft tabs (spaces instead of tabs).
    -- shiftwidth = 2,

    -- Tell Neovim to use spaces instead of tabs for indentation when set to true.
    -- expandtab = true,

    -- Characters to fill the statuslines, vertical separators and special lines in the window.
    fillchars = {
      eob = " ",
      fold = " ",
      foldopen = "",
      foldsep = "│",
      foldclose = "",
    },
  },

  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
