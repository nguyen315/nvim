vim.keymap.set('n', '<leader>sr', '<cmd>lua require("spectre").open()<CR>', {
	desc = "Open Spectre"
})

return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		open_cmd = 'vnew | :vertical resize 60',
		live_update = true,
		default = {
			find = {
				--pick one of item in find_engine
				cmd = "rg",
				options = { "ignore-case", "hidden" }
			},
			replace = {
				--pick one of item in replace_engine
				cmd = "sed",
			},
		}
	}
}
