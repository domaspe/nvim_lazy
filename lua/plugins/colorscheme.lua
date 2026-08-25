local function tmux_background()
  local theme = vim.fn.system({ "tmux", "show-options", "-gv", "@theme" })
  return vim.trim(theme) == "light" and "light" or "dark"
end

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
    init = function()
      vim.o.background = tmux_background()
    end,
    opts = {
      -- onedark switches style to "light" itself when background is light.
      style = "darker",
    },
  },
}
