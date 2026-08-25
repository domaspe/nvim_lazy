return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = { "nvim-mini/mini.icons" },
    keys = {
      { "<leader>um", "<cmd>Markview Toggle<cr>", desc = "Toggle Markview" },
    },
    opts = {
      preview = {
        icon_provider = "mini",
        filetypes = { "markdown" },
        modes = { "n", "no", "c", "i" },
        hybrid_modes = { "n", "i" },
      },
      html = { enable = false },
      latex = { enable = false },
      yaml = { enable = false },
    },
  },
}
