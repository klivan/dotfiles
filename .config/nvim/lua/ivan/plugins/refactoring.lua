-- import refactoring plugin safely
local setup, refactoring = pcall(require, "refactoring")
if not setup then
	return
end

-- enable refactoring
refactoring.setup()
