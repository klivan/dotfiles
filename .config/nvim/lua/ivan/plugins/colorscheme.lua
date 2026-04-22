-- return {
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			local bg = "#011628"
-- 			local bg_dark = "#011423"
-- 			local bg_highlight = "#143652"
-- 			local bg_search = "#0A64AC"
-- 			local bg_visual = "#275378"
-- 			local fg = "#CBE0F0"
-- 			local fg_dark = "#B4D0E9"
-- 			local fg_gutter = "#627E97"
-- 			local border = "#547998"
--
-- 			require("tokyonight").setup({
-- 				style = "night",
-- 				on_colors = function(colors)
-- 					colors.bg = bg
-- 					colors.bg_dark = bg_dark
-- 					colors.bg_float = bg_dark
-- 					colors.bg_highlight = bg_highlight
-- 					colors.bg_popup = bg_dark
-- 					colors.bg_search = bg_search
-- 					colors.bg_sidebar = bg_dark
-- 					colors.bg_statusline = bg_dark
-- 					colors.bg_visual = bg_visual
-- 					colors.border = border
-- 					colors.fg = fg
-- 					colors.fg_dark = fg_dark
-- 					colors.fg_float = fg
-- 					colors.fg_gutter = fg_gutter
-- 					colors.fg_sidebar = fg_dark
-- 				end,
-- 			})
-- 			-- load the colorscheme here
-- 			vim.cmd([[colorscheme tokyonight]])
--
-- 		end,
-- 	},
-- }
return {
	{
		"loctvl842/monokai-pro.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("monokai-pro").setup({
				transparent_background = false,
				terminal_colors = true,
				devicons = true, -- highlight the icons of `nvim-web-devicons`
				styles = {
					comment = { italic = true },
					keyword = { italic = true }, -- any other keyword
					type = { italic = true }, -- (preferred) int, long, char, etc
					storageclass = { italic = true }, -- static, register, volatile, etc
					structure = { italic = true }, -- struct, union, enum, etc
					parameter = { italic = true }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = true }, -- attribute of tag in reactjs
				},
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
				-- Enable this will disable filter option
				day_night = {
					enable = false, -- turn off by default
					day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
					night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				},
				inc_search = "background", -- underline | background
				background_clear = {
					-- "float_win",
					"toggleterm",
					"telescope",
					-- "which-key",
					"renamer",
					"notify",
					-- "nvim-tree",
					-- "neo-tree",
					"bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
				}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
				plugins = {
					bufferline = {
						underline_selected = false,
						underline_visible = false,
					},
					indent_blankline = {
						context_highlight = "pro", -- default | pro
						context_start_underline = false,
					},
				},
				-- ---@param c Colorscheme
				-- override = function(c) end,
				-- ---@param cs Colorscheme
				-- ---@param p ColorschemeOptions
				-- ---@param Config MonokaiProOptions
				-- ---@param hp Helper
				-- override = function(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper) end,
			})

			vim.cmd([[colorscheme monokai-pro]])
		end,
	},
}
