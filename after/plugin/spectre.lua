require("spectre").setup({
	open_cmd = 'vnew | :vertical resize 40',
})

vim.keymap.set('n', '<leader>sr', '<cmd>lua require("spectre").open()<CR>', {
	desc = "Open Spectre"
})
