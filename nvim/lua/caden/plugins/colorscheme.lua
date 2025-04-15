-- return {
-- 	"morhetz/gruvbox",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.o.background = "dark" -- or "light" for light mode
-- 		vim.cmd("colorscheme gruvbox")
-- 	end,
-- }
-- "folke/tokyonight.nvim",
-- priority = 1000,
-- 	config = function()
-- 		vim.o.background = "dark" -- or "light" for light mode
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }

return {
	"morhetz/gruvbox",
	priority = 1000,
	config = function()
		-- Set the background to dark
		vim.o.background = "dark"

		-- Apply the gruvbox colorscheme
		vim.cmd.colorscheme("gruvbox")

		-- Set transparent background
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
	end,
}
