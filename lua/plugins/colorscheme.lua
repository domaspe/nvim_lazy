return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.o.background = "dark"
      end,
      set_light_mode = function()
        vim.o.background = "light"
      end,
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local function apply_theme()
        require("onedark").setup({
          style = vim.o.background == "light" and "light" or "dark",
        })
        require("onedark").load()
      end

      apply_theme()

      vim.api.nvim_create_autocmd("OptionSet", {
        pattern = "background",
        callback = apply_theme,
      })
    end,
  },
}
