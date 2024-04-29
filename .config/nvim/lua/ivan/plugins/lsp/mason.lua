-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"gopls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		-- python
		-- "flake8",
		-- "black",
		"ruff",
		"pyright",
		"python",
		"gopls",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})

require("lspconfig").gopls.setup({
	gopls_cmd = { "~/go/gopls" },
	fillstruct = "gopls",
	dap_debug = true,
	dap_debug_gui = true,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

-- custom/init.lua
-- local enable_providers = {
-- 	"python3_provider",
-- 	"python3",
-- }
--
-- vim.g.python3_host_prog = "~/.pyenv/shims/python"
--
-- for _, plugin in pairs(enable_providers) do
--   vim.g["loaded_" .. plugin] = nil
--   vim.cmd("runtime" .. plugin)
-- end
