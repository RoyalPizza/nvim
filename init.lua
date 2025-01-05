-- bootstrap lazy and plugin config 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- vim options
vim.g.mapleader = ' '			-- make the space key our leader 
vim.g.localmapleader = '\\'		-- TODO: learn what this is
vim.opt.number = true			-- show line numbers
vim.opt.relativenumber = true		-- show relative line numbers
vim.opt.splitbelow = true		-- default splits to B instead of U
vim.opt.splitright = true		-- deafult splits to R instead of L
vim.opt.wrap = false			-- dont warp lines
vim.opt.shiftwidth = 4			--
vim.opt.virtualedit = "block"		-- when using visual block, use a virtual cursor
vim.opt.inccommand = "split"		-- this puts the search/replace in a new split
vim.opt.ignorecase = true		-- when typing commands, ignore case sensitivity
vim.opt.termguicolors = true		-- basically uses better color support
vim.opt.clipboard = "unnamedplus"	-- TODO: decide if I want this. Not use to multiple clipboards yet

-- setup lazy and plugins
require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ 
	    "rebelot/kanagawa.nvim",
	    config = function() vim.cmd.colorscheme("kanagawa-wave") end,
	},
	{
	    "nvim-lualine/lualine.nvim",
	    dependencies = { "nvim-tree/nvim-web-devicons" },
	    config = function() require("lualine").setup() end,
	},
	{
	    -- TODO: learn the differences this between what the theme does by deafult and/or an LSP.
	    -- I would assume having this and an LSP converting both to AST is excessive.
	    "nvim-treesitter/nvim-treesitter",
	    config = function()
		require("nvim-treesitter.configs").setup({
		    ensure_installed = { 
			"c", "lua", "vim", "vimdoc", "query", "c_sharp", "python", "go",
			"html", "java", "javascript", "json", "toml", "cpp", "css",
			"gdscript", "rust", 
		    },
		    highlight = { enable = true },	-- TODO: learn what this does
		    --auto_install = true,		-- This would auto install languages not defined above
		})
	    end,
	},
	{
	    "akinsho/bufferline.nvim",
	    dependencies = { "nvim-tree/nvim-web-devicons" },
	    config = function() require("bufferline").setup() end,
	},
	{
	    "nvim-neo-tree/neo-tree.nvim",
	    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	    config = function() require("neo-tree").setup() end,
	},
	{ "folke/trouble.nvim" },
	{
	    "nvim-telescope/telescope.nvim",
	    dependencies = { "nvim-lua/plenary.nvim" },
	},
    })

-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim tree keymaps
--vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")	-- TODO: FIX
