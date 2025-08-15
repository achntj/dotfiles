-- big cursor in insert mode
vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- open new files without saving current
vim.opt.hidden = true

-- search highlights incrementally
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- min # of lines around cursor
vim.opt.scrolloff = 8
-- always show sign column
vim.opt.signcolumn = "yes"
-- @ symbol is treated as part of a filename
vim.opt.isfname:append("@-@")
-- always show tabs
vim.opt.showtabline = 2

-- ms to wait for triggering an event
vim.opt.updatetime = 50

-- Line lenght marker at 80 columns
vim.opt.colorcolumn = "80"

-- set statusline to always, per nvim instance
vim.opt.laststatus = 3

-- disable netrw (NVIM TREE)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.py",
  callback = function()
    vim.opt.textwidth = 79
    vim.opt.colorcolumn = "79"
  end
}) -- for python formatting

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.html", "*.css", "*.lua" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
}) -- for javascript formatting

