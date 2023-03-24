-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "W", "<cmd>w<cr>", opts)
keymap("n", "Q", "<cmd>q<cr>", opts)
keymap("n", "<c-q>", "<cmd>quitall<cr>", opts)
keymap("i", "<a-l>", "<esc>la", opts)
keymap("i", "<a-h>", "<esc>ha", opts)
vim.api.nvim_del_keymap("n", "gr")
vim.api.nvim_del_keymap("n", "gd")
vim.api.nvim_set_keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
