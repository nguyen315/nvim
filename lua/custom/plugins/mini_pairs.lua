return {
	-- pair parathenses
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	config = function(_, opts)
		require("mini.pairs").setup(opts)
	end,

}
