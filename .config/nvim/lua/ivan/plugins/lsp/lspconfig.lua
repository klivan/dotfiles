return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local pyright_extra_paths = {
			"lib/audit-logs",
			"lib/datacenter-spinup",
			"lib/json-api-common",
			"lib/dd-kafka-shards",
			"lib/dd-sessions",
			"lib/dd-logging",
			"lib/dd-watchdog-metric-signals",
			"lib/dogpound",
			"lib/dd-keys",
			"lib/api-key-usage-tracker",
			"lib/dd-db",
			"lib/dogweb-lib",
			"lib/static-asset",
			"lib/redis-v2",
			"lib/dd-util-context",
			"lib/event-grammar",
			"lib/dd-beaker-extensions",
			"lib/datasets",
			"lib/cloud-cost-management",
			"lib/mcnulty-base",
			"lib/dd-util-experiments",
			"lib/terminator",
			"lib/zoltron",
			"lib/dd-security",
			"lib/datalayer-v2",
			"lib/dd-identity",
			"lib/dogweb-linters",
			"lib/dd-resilience",
			"lib/dd-numpy",
			"lib/dd-compress",
			"lib/integration-base",
			"lib/historical-metrics-query",
			"lib/point-payload-ext",
			"lib/on-behalf-of",
			"lib/dd-auth",
			"lib/dogweb-version",
			"lib/dd-util",
			"lib/ephemera",
			"lib/ddgrpc",
			"lib/ddgrpc/src",
			"lib/dd-org-config",
			"lib/dogweb-model",
			"lib/cfgdistributionlib",
			"lib/billing",
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure gopls using new API
		vim.lsp.config.gopls = {
			cmd = { "dd-gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			cmd_env = {
				GOPLS_DISABLE_MODULE_LOADS = 1,
			},
			root_markers = { "go.work", "go.mod", ".git" },
			capabilities = capabilities,
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = false,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = true,
				},
			},
		}

		-- configure pyright using new API
		vim.lsp.config.pyright = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
			capabilities = capabilities,
			settings = {
				pyright = { autoImportCompletion = true },
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "off",
						extraPaths = pyright_extra_paths,
					},
				},
			},
		}

		-- configure lua_ls using new API
		vim.lsp.config.lua_ls = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = {
				".luarc.json",
				".luarc.jsonc",
				".luacheckrc",
				".stylua.toml",
				"stylua.toml",
				"selene.toml",
				"selene.yml",
				".git",
			},
			capabilities = capabilities,
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		}

		-- configure other servers using new API
		local simple_servers = {
			{ name = "html", cmd = { "vscode-html-language-server", "--stdio" }, filetypes = { "html" } },
			{
				name = "cssls",
				cmd = { "vscode-css-language-server", "--stdio" },
				filetypes = { "css", "scss", "less" },
			},
			{
				name = "tailwindcss",
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
			},
			{
				name = "emmet_ls",
				cmd = { "emmet-ls", "--stdio" },
				filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
			},
		}

		for _, server in ipairs(simple_servers) do
			vim.lsp.config[server.name] = {
				cmd = server.cmd,
				filetypes = server.filetypes,
				capabilities = capabilities,
			}
		end

		-- Enable the LSP servers for their respective filetypes
		vim.lsp.enable({ "gopls", "pyright", "lua_ls", "html", "cssls", "tailwindcss", "emmet_ls" })
	end,
}
