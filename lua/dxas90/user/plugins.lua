local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'fatih/vim-go'
  use 'jjo/vim-cue'
  use 'hashivim/vim-terraform'

  -- Colorschemes
	use 'tomasr/molokai'
	use 'dracula/vim'
	use 'gosukiwi/vim-atom-dark'
  use 'tomasiser/vim-code-dark'
  use 'bluz71/vim-nightfly-guicolors'
  use 'yonlu/omni.vim'
  use 'navarasu/onedark.nvim'
  use 'rose-pine/neovim'
  use 'ishan9299/nvim-solarized-lua'

	-- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

	use {'akinsho/bufferline.nvim'}

	-- Git integration
	use "tpope/vim-fugitive"
	use "mhinz/vim-signify"
	
	-- Fuzzy finder 
	use {
  	'nvim-telescope/telescope.nvim',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Syntax highlight
	use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
	use 'p00f/nvim-ts-rainbow'

	-- Autocompletion
	use {
		"hrsh7th/nvim-cmp", -- The completion plugin
		requires = { "L3MON4D3/LuaSnip" }
	}
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions 
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "rafamadriz/friendly-snippets" -- snippets collection
	use "hrsh7th/cmp-nvim-lsp"
	
	-- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}

	-- Linting and formatting
	use "jose-elias-alvarez/null-ls.nvim"

	-- Status line
    use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- auto tag and autp pairs
	use "windwp/nvim-ts-autotag"
	use "windwp/nvim-autopairs"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
