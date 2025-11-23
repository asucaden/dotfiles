return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			java = { "checkstyle" },
			c = { "cpplint" },
			cpp = { "cpplint" },
		}

		-- Configure cpplint to ignore copyright warnings
		lint.linters.cpplint.args = {
			"--filter=-legal/copyright",
			"--linelength=120",
		}

		lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
			-- try to ignore "No ESLint configuration found" error
			-- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
			-- update: 20240814, following is working
			if diagnostic.message:find("Error: Could not find config file") then
				return nil
			end
			return diagnostic
		end)

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		local function try_lint_safely()
			lint.try_lint(nil, { ignore_errors = true })
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				try_lint_safely()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			try_lint_safely()
		end, { desc = "Trigger linting for current file" })
	end,
}
