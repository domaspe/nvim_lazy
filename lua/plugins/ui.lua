return {
  -- Disable inlay hints in LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
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
      -- No automatic completion in markdown; <C-l> still shows the menu
      completion = {
        menu = {
          auto_show = function()
            return vim.bo.filetype ~= "markdown"
          end,
        },
        ghost_text = {
          enabled = function()
            return vim.bo.filetype ~= "markdown"
          end,
        },
      },
    },
  },
}
