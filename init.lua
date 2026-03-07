require('huyvu8051')
vim.api.nvim_create_autocmd("FileType", {
	pattern = {'java', 'javascript', 'typescript', 'javascript', 'rust', 'lua'},
	callback = function()
		vim.treesitter.start()
	end,
})
vim.lsp.enable('luals')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jdtls')

vim.diagnostic.config({
  virtual_text = true
})

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

