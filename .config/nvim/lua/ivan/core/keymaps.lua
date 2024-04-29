-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk/kj to exit insert mode
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

-- clear search highlights
keymap.set("n", "<ESC>", ":nohl<CR>", { silent = true })
-- keymap.set("n", "<C-n>", ":nohl<CR>", { silent = true })
-- keymap.set("v", "<C-n>", ":nohl<CR>", { silent = true })
-- keymap.set("i", "<C-n>", ":nohl<CR>", { silent = true })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- " Quickfix Shortcuts
-- map <C-j> :cn<CR>
-- map <C-k> :cp<CR>

-- " Use qq in normal mode to close current buffer
keymap.set("n", "qq", ":bp <BAR> bd #<CR>", { silent = true })

keymap.set("n", "<leader>c", '"_c')

-- write without formatting
keymap.set("n", "<leader>w", ":noa w<CR>", { silent = true })
-- do not enable this if your leader  key is space: it will add delay to space key
-- keymap.set("i", "<leader>w", "<ESC>:noa w<CR>", { silent = true })

keymap.set("n", "<leader>bb", "Oif err != nil {\nreturn err\n}<C-c>")
keymap.set("n", "<leader>bn", "Oif err != nil {\nreturn nil, err\n}<C-c>")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>;", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>l", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
-- temp
keymap.set("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<leader>sr", "<cmd>Telescope resume<cr>")

local builtin = require("telescope.builtin")
keymap.set("n", "<leader>fr", builtin.lsp_references)
keymap.set("n", "<C-p>", builtin.git_files) -- list available help tags

-- keymap.set({ "n", "x" }, "<leader>rr", function()
-- 	require("telescope").extensions.refactoring.refactors()
-- end)

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- quickfix
-- keymap.set("n", "<C-j>", ":cn<CR>zz")
-- keymap.set("n", "<C-k>", ":cp<CR>zz")

-- sort
keymap.set("v", "<leader>s", ":sort<CR>")

keymap.set("n", "<C-g>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- open tmux sessionizer in new tmux window
-- copy current file name and line number to clipboard
keymap.set("n", "<leader>y", "<cmd>let @+ = expand('%')<CR>") -- copy current file name and line number to clipboard
keymap.set("n", "<leader>b", "<cmd>let @+ = 'b ' . join([expand('%'),  line('.')], ':')<CR>") -- copy current file name and line number to clipboard
