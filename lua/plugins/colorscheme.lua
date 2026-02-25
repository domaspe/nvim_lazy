return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker",
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("onedark")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("onedark")
      end,
    },
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
  { "typicode/bg.nvim", lazy = false },
}
