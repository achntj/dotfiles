-- tree
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<cr>")

-- format code using LSP
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)

-- Key mappings for Telescope
vim.keymap.set("n", "<leader>pf", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>gf", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>ps", ":Telescope live_grep<cr>")

