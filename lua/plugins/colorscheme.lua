local function tmux_background()
  local theme = vim.fn.system({ "tmux", "show-options", "-gv", "@theme" })
  return vim.trim(theme) == "light" and "light" or "dark"
end

local function apply_tmux_theme()
  local bg = tmux_background()
  if vim.o.background ~= bg then
    require("onedark").set_options("style", "darker")
    vim.o.background = bg
    vim.cmd("colorscheme onedark")
  end
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
      vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
        group = vim.api.nvim_create_augroup("TmuxTheme", { clear = true }),
        callback = apply_tmux_theme,
      })
      vim.fn.timer_start(5000, apply_tmux_theme, { ["repeat"] = -1 })
    end,
    opts = {
      -- onedark switches style to "light" itself when background is light.
      style = "darker",
    },
  },
}
