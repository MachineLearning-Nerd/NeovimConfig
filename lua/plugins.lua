--[[--
Copyright: Mareana
File              : plugins.lua
Author            : Dinesh Jinjala <dinesh.jinjala@mareana.com>
Date              : 05/07/2023 15:54:19
Last Modified Date: 31/01/2024 17:43:40
Last Modified By  : Dinesh Jinjala <dinesh.jinjala@mareana.com>
--]]
--

require("mason").setup()
-- require("mini.pairs").setup()
-- require("bufferline").setup()
require("barbar").setup({
	-- Enable/disable animations
	animation = true,
	insert_at_start = true,
	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- Or, specify the event which the sidebar executes when leaving:
		["neo-tree"] = { event = "BufWipeout" },
	},
})
require("trouble").setup()
require("noice").setup()
require("neo-tree").setup({
	source_selector = {
		winbar = true,
		statusline = true,
	},
	filesystem = {
		filtered_items = {
			visible = true,
			show_hidden_count = true,
			hide_dotfiles = false,
			hide_gitignored = false,
			always_show = { -- remains visible even if other settings would normally hide it
				"*.yml",
			},
		},
	},
	window = {
		mappings = {
			["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
		},
	},
	nesting_rules = {
		["package.json"] = {
			pattern = "^package%.json$", -- <-- Lua pattern
			files = { "package-lock.json", "yarn*" }, -- <-- glob pattern
		},
	},
})
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "c", "lua", "python", "java", "vim", "markdown", "markdown_inline", "regex", "sql" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})
require("catppuccin").setup({
	color_overrides = {
		mocha = {
			-- base = "#202020",
			base = "#000000",
			-- mantle = "#2F2F2F"
		},
	},
	highlight_overrides = {
		mocha = function(mocha)
			return {
				-- Comment = { bg = mocha.flamingo },
				-- CmpBorder = { fg = "#3e4145" },
			}
		end,
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "black", "autoflake" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },

		yamlfix = { "yamlfix", "yamlfmt" },
	},
	-- format_on_save = {
	-- 	-- These options will be passed to conform.format()
	-- 	timeout_ms = 1000,
	-- 	lsp_fallback = true,
	-- },
})
return require("packer").startup(function()
	-- Using Packer
	use({ "embark-theme/vim", as = "embark" })
	-- use 'navarasu/onedark.nvim'
	use("olimorris/onedarkpro.nvim")
	use("wbthomason/packer.nvim")
	use({ "neoclide/coc.nvim", branch = "release" })
	use("folke/tokyonight.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- Project
	use({ "nvim-telescope/telescope-project.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-raw.nvim" } },
	})
	-- Lua
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})
	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"williamboman/mason.nvim",
	})
	-- use({ "echasnovski/mini.nvim", branch = "stable" })
	use({
		"folke/trouble.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})
	use({
		"stevearc/conform.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"williamboman/mason.nvim",
		},
		config = function()
			require("conform").setup()
		end,
	})
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup()
		end,
	})
	use({
		"romgrk/barbar.nvim",
		requires = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
	})

	-- -- using packer.nvim
	-- use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
end)
