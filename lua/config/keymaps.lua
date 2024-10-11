-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "W", ":w<CR>", { noremap = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume from last search" }
)

vim.keymap.set(
  "n",
  "<leader>f",
  require("telescope.builtin").find_files,
  { noremap = true, silent = true, desc = "Find from git files" }
)

vim.keymap.set(
  "n",
  "<leader>s",
  require("telescope.builtin").live_grep,
  { noremap = true, silent = true, desc = "Search git files" }
)

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })

-- Run buffer in Python:
vim.keymap.set("n", "<leader>n", function()
  vim.cmd("split")

  vim.cmd("term deno run %")
end, { noremap = true, silent = true, desc = "Run in Deno/Node" })

-- Run buffer in Python:
vim.keymap.set("n", "<leader>p", function()
  vim.cmd("split")

  vim.cmd("term python %")
end, { noremap = true, silent = true, desc = "Run in Python" })

-- Run buffer in an interactive Python shell:
vim.keymap.set("n", "<leader>ip", function()
  vim.cmd("split")

  vim.cmd("term ipython % --i")
end, { noremap = true, silent = true, desc = "Run in Python" })
