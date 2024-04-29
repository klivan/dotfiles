-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	debug = true,
	debounce = 1000,
	default_timeout = 5000,
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
		formatting.prettier.with({ disabled_filetypes = { "yaml" } }), -- js/ts formatter
		formatting.stylua, -- lua formatter
		-- diagnostics.eslint_d.with({ -- js/ts linter
		-- 	-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
		-- 	condition = function(utils)
		-- 		return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
		-- 	end,
		-- }),
		-- python
		diagnostics.ruff,
		formatting.black.with({
			command = "/opt/homebrew/bin/black",
			args = { "--quiet", "-" },
		}),
		diagnostics.revive,

		-- golang
		formatting.gofmt,
		formatting.goimports,
		formatting.golines.with({
			extra_args = {
				"--max-len=100",
				"--base-formatter=gofumpt",
			},
		}),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
