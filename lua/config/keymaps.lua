-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Unbind C-b and C-x to allow tmux prefix
vim.keymap.set("n", "<C-b>", "<Nop>")
vim.keymap.set("n", "<C-x>", "<Nop>")

-- Open VS Code in current directory
vim.keymap.set("n", "<leader>gd", function()
  vim.fn.jobstart({ "code", vim.fn.getcwd() }, { detach = true })
end, { desc = "Open VS Code" })

-- Paste in visual mode without overwriting register
vim.keymap.set("x", "p", '"_dP')
