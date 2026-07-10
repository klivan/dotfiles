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
			python = { "ruff" },
			go = { "golangcilint" },
		}

		-- golangci-lint exits 7 ("an error was logged") for buffers it can't resolve
		-- to a Go package: fugitive/diff views, build-tag-excluded files, etc. Output
		-- is still valid JSON, so ignore the exit code and just parse diagnostics.
		lint.linters.golangcilint.ignore_exitcode = true

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- Skip non-file buffers (fugitive/diff/help/etc.) and unsaved files:
				-- nvim-lint passes the buffer's dir to the linter, and a path it
				-- can't resolve makes golangci-lint exit 7.
				if vim.bo.buftype ~= "" then
					return
				end
				local fname = vim.api.nvim_buf_get_name(0)
				if fname == "" or vim.fn.filereadable(fname) == 0 then
					return
				end
				lint.try_lint()
			end,
		})

		-- vim.keymap.set("n", "<leader>l", function()
		-- 	lint.try_lint()
		-- end, { desc = "Trigger linting for current file" })
	end,
}
