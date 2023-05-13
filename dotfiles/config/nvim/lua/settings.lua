vim.o.hidden = true

-- Enable syntax highlighting
vim.cmd [[syntax on]]

-- Turn Off Swap Files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- Persistent Undo
vim.o.undofile = true

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.expandtab = true

-- Enable filetype plugins and indentation
vim.cmd [[filetype plugin on]]
vim.cmd [[filetype indent on]]

-- Display tabs and trailing spaces visually
vim.o.list = true
vim.o.listchars = "tab:  ,trail:·"

-- Don't wrap lines
vim.o.wrap = false

-- Wrap lines at convenient points
vim.o.linebreak = true

-- Folds
vim.o.foldmethod = "indent"    -- fold based on indent
vim.o.foldnestmax = 3          -- deepest fold is 3 levels
vim.o.foldenable = false       -- don't fold by default
vim.o.foldlevel = 1

-- Completion
vim.o.wildmode = "list:longest"
vim.o.wildmenu = true          -- enable ctrl-n and ctrl-p to scroll thru matches
vim.o.wildignore = "*.o,*.obj,*~,*.png,*.jpg,*.gif"
vim.o.wildignore = vim.o.wildignore .. ",*nvim/backups*,*sass-cache*,*DS_Store*"
vim.o.wildignore = vim.o.wildignore .. ",vendor/rails/**,vendor/cache/**,*.gem"
vim.o.wildignore = vim.o.wildignore .. ",log/**,tmp/**"

