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
