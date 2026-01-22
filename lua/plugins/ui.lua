return {
  -- Disable bufferline (tabline)
  -- { "akinsho/bufferline.nvim", enabled = false },

  -- Disable inlay hints in LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
