-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "W", ":w<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })

-- Run buffer in Python:
vim.keymap.set("n", "<leader>p", function()
  vim.cmd("split")

  -- vim.cmd("term python %")
  vim.cmd("term ipython % --i")
end, { noremap = true, silent = true, desc = "Run in Python" })

-- Run buffer in Deno/Node:
vim.keymap.set("n", "<leader>n", function()
  vim.cmd("split")

  vim.cmd("term deno run %")
end, { noremap = true, silent = true, desc = "Run in Deno/Node" })

-- Run buffer in an interactive Python shell:
vim.keymap.set("n", "<leader>ip", function()
  vim.cmd("split")

  vim.cmd("term ipython % --i")
end, { noremap = true, silent = true, desc = "Run in Python" })

-- Remove default keymaps for switch between
vim.api.nvim_del_keymap("n", "H")
vim.api.nvim_del_keymap("n", "L")

local function doPrint()
  local currentFileType = vim.bo.filetype
  print("Current file type: " .. currentFileType)
end

vim.keymap.set("n", "<leader>1", doPrint, { noremap = true, silent = true, desc = "Print Debug" })
