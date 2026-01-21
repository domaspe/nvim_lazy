return {
  -- Git diff viewer with side-by-side comparison
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" }, -- lazy load on these commands
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    },
  },
  -- Disable snacks.nvim default <leader>gd to use diffview instead
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false },
    },
  },
}
