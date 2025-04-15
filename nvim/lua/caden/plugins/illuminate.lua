return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- configuration options go here
		delay = 100,
		filetypes_denylist = {
			"dirvish",
			"fugitive",
			"NvimTree",
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
