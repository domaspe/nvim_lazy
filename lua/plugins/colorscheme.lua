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
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
}
