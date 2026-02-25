return {
  -- Disable bufferline (tabline)
  { "akinsho/bufferline.nvim", enabled = false },

  -- Disable inlay hints in LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  -- Move command line to the bottom of the screen
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },

  -- Surround: gsa (add), gsd (delete), gsr (replace)
  {
    "nvim-mini/mini.surround",
    version = false,
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  -- Remap manual completion trigger from <C-space> to <C-l>
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
      },
    },
  },
}
