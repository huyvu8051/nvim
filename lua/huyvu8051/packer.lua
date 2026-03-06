vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', version = '0.2.1',
		requires = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim' },
		}
	}

	use 
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	} 

	use {
		'nvim-treesitter/nvim-treesitter',
		{run = ':TSUpdate'}
	}
	use {
		'mbbill/undotree'
	}
	use {
		'tpope/vim-fugitive'
	}
end)
