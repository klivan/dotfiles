local builtin = require('telescope.builtin')

-- set leader key to space
vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- vim-maximizer
keymap.set("n", "<leader>z", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>;", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

keymap.set('n', '<C-p>', builtin.git_files, {})


-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

vim.keymap.set("n", "<C-g>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- open tmux sessionizer in new tmux window

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

