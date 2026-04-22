-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Added by me
--
keymap.set("v", "<leader>s", ":sort<CR>")
keymap.set("n", "<C-g>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- open tmux sessionizer in new tmux window
--
-- copy current file name and line number to clipboard
keymap.set("n", "<leader>y", "<cmd>let @+ = expand('%')<CR>")
keymap.set("n", "<leader>b", "<cmd>let @+ = 'b ' . join([expand('%'),  line('.')], ':')<CR>")

keymap.set("n", "<leader>gt", "<cmd>! cd %:h; go test .<CR>")
keymap.set("n", "<leader>l", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance

keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- write without formatting
keymap.set("n", "<leader>w", ":noa w<CR>", { silent = true })

-- " Use qq in normal mode to close current buffer
keymap.set("n", "qq", ":bp <BAR> bd #<CR>", { silent = true })

keymap.set("n", "<leader>;", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

keymap.set("n", "<ESC>", ":nohl<CR>", { silent = true })

-- Change without copying into register
keymap.set("n", "<leader>c", '"_c')

keymap.set("n", "<leader>l", ":FzfLua buffers<CR>", { silent = true })
