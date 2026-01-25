return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("oxocarbon")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("kanagawa")
      end,
    },
  },
  { "rebelot/kanagawa.nvim" },
  { "joshdick/onedark.vim", lazy = true },
}
