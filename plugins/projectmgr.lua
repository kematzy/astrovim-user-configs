return {
  "charludo/projectmgr.nvim",
  lazy = false, -- important!
  opts = {
    autogit = {
      enabled = false,
      command = "git pull --ff-only",
    },
    reopen = false,
    session = { enabled = false, file = ".nvim-session" },
  },

  keys = {
    { "<leader>P", "<cmd>ProjectMgr<cr>", desc = "Project Manager" },
  },
}
