-- import vim-gh-line plugin safely
local setup, gh_line = pcall(require, "vim-gh-line")
if not setup then
	return
end

-- configure/enable gitsigns
gh_line.setup()
