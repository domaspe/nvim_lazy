return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("catppuccin-mocha")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("catppuccin-latte")
      end,
    },
  },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
}
