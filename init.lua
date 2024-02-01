-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Equivalent of ':set number'
vim.wo.number = true

-- Equivalent of ':set relativenumber'
vim.wo.relativenumber = true

-- Equivalent of ':set autoindent'
vim.bo.autoindent = true

-- Equivalent of ':set tabstop=4'
vim.bo.tabstop = 4

-- Equivalent of ':set shiftwidth=4'
vim.bo.shiftwidth = 4

-- Equivalent of ':set softtabstop=4'
vim.bo.softtabstop = 4

-- Equivalent of ':set noswapfile'
vim.bo.swapfile = false

-- Equivalent of ':set mouse=a'
vim.o.mouse = "a"

-- Equivalent of ':set cmdheight=2'
vim.o.cmdheight = 2

-- Equivalent of ':set encoding=utf8'
vim.o.encoding = "utf8"

-- Equivalent of ':set termguicolors'
vim.o.termguicolors = true

-- Equivalent of ':set autoread'
vim.o.autoread = true

-- Equivalent of 'let $NVIM_TUI_ENABLE_TRUE_COLOR=1'
vim.g.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- Equivalent of 'let mapleader = " "'
vim.g.mapleader = " "

-- Equivalent of 'nnoremap <leader>h :wincmd h<CR>'
vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":e!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>nn", ":Neotree<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>nb", ":Neotree buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>nf", ":set foldmethod=manual<CR>", { noremap = true })

-- Equivalent of 'set foldlevel=99'
vim.wo.foldlevel = 99
-- Equivalent of 'set foldmethod=manual'
vim.wo.foldmethod = "manual"
-- Equivalent of 'autocmd InsertLeave,WinEnter * setlocal foldmethod=manual'
vim.cmd([[ autocmd InsertLeave,WinEnter * setlocal foldmethod=manual ]])
-- Equivalent of 'autocmd InsertEnter,WinLeave * setlocal foldmethod=manual'
vim.cmd([[ autocmd InsertEnter,WinLeave * setlocal foldmethod=manual ]])

-- -- Equivalent to :resize
-- local win = vim.api.nvim_get_current_win()
-- vim.api.nvim_win_set_height(win, 30)

-- Prettier command
vim.api.nvim_set_keymap("n", "gp", ":silent %!prettier --stdin-filepath %<CR>", { noremap = true })

-- Window commands
vim.api.nvim_set_keymap("n", "<leader>sz", "<C-w>|", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wa", "<C-w>_", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wo", "<C-w>=", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wz", ":vertical resize<CR>:resize<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wv", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wh", ":split<CR>", { noremap = true })

-- Header Fields:
vim.g.header_field_author = "Dinesh Jinjala"
vim.g.header_field_author_email = "dinesh.jinjala@mareana.com"
vim.g.header_field_timestamp_format = "%d/%m/%Y %H:%M:%S"
vim.g.header_auto_add_header = 1
vim.g.header_max_size = 9
vim.g.header_alignment = 1
vim.g.header_field_modified_timestamp = 1
vim.g.header_field_copyright = "Copyright: Mareana"

-- Window resize commands
vim.api.nvim_set_keymap("n", "<leader>+", ":vertical resize +5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>-", ":vertical resize -5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rp", ":resize 100<CR>", { noremap = true })

-- Telescope commands
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })

-- Normal commands
vim.api.nvim_set_keymap("n", "<leader>na", ":AddHeader<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", '"*]p:set nopaste<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>P", '"*]P:set nopaste<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y)', { noremap = true })
-- vim.api.nvim_set_keymap("v", "<leader>/", "gc", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>/", "gc_", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>d", "oimport pdb;pdb.set_trace()<esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>np", ":Pydocstring<CR>", { noremap = true })

-- Visual commands
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true })

-- Normal quit and save commands
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<CR>", { noremap = true })

-- Map <C-l> to call CocActionAsync('jumpDefinition')
vim.api.nvim_set_keymap("n", "<C-l>", ":call CocActionAsync('jumpDefinition')<CR>", { noremap = true })

-- -- GoTo code navigation
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Use K to show documentation in preview window
-- Error detected while processing /Users/dineshjinjala/.config/nvim/init.lua:
-- E81: Using <SID> not in a script context
-- vim.api.nvim_set_keymap("n", "K", ":call <SID>show_documentation()<CR>", { silent = true })
