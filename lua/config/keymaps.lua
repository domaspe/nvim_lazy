-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Unbind C-b and C-x to allow tmux prefix
-- vim.keymap.set("n", "<C-b>", "<Nop>")
-- vim.keymap.set("n", "<C-x>", "<Nop>")

-- Open VS Code in current directory
vim.keymap.set("n", "<leader>gd", function()
  vim.fn.jobstart({ "code", vim.fn.getcwd() }, { detach = true })
end, { desc = "Open VS Code" })

-- Safe defaults: d/p don't pollute registers
vim.keymap.set({ "n", "x" }, "d", '"_d', { desc = "Delete (black hole)" })
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without overwriting register" })

-- Leader variants: original register-affecting behavior
vim.keymap.set({ "n", "x" }, "<leader>D", "d", { desc = "Delete (yank into register)" })
vim.keymap.set("x", "<leader>p", "p", { desc = "Paste (replace register)" })

-- Disable arrow keys (use hjkl)
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

-- Copy file path to clipboard
vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy file path" })

vim.keymap.set("n", "<leader>yl", function()
  vim.fn.setreg("+", vim.fn.expand("%:p") .. ":" .. vim.fn.line("."))
end, { desc = "Copy file path:line" })
