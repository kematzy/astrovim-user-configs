-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- NORMAL MODE: first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Add ZenMode toggle
    ["<leader>Z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    -- Toggle word wrap
    ["<M-z>"] = { "<cmd>set wrap!<cr>", desc = "Toggle word wrap" },

    -- Neotest shortcuts
    ["<leader>tt"] = {
      function()
        local nt = require "neotest"
        nt.run.run(vim.fn.expand "%")
      end,
      desc = "Neotest Run",
    },
    ["<leader>tw"] = {
      function()
        local nt = require "neotest"
        nt.watch.toggle()
        nt.summary.toggle()
      end,
      desc = "Neotest Watch",
    },
  },
  -- TERMINAL MODE
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  -- VISUAL MODE
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
  },
  -- INSERT MODE
  i = {},
}
