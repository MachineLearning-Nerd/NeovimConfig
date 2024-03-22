-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- This line of code sets the s key in normal mode ('n') to work as it does in Vim. The noremap = true option ensures that the mapping is not recursive.
vim.api.nvim_set_keymap("n", "s", "s", { noremap = true })
vim.api.nvim_set_keymap("v", "s", "s", { noremap = true })
vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? "\\<C-y>" : "\\<CR>"', { expr = true, noremap = true })

-- This will map the F key to the Flash jump functionality. Please replace <Plug>(flash-jump) with the correct command if it’s different in your configuration
-- vim.api.nvim_set_keymap("n", "F", "Flash", { noremap = true })
