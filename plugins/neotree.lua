return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      -- Git related
      enable_git_status = true,
      git_status_async = true,

      window = {
        -- move the position to the right side of the screen
        position = "right",
      },
    })
  end,
}
