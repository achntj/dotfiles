-- Telescope
vim.keymap.set("n", "<leader>pf", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>gf", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>ps", ":Telescope live_grep<cr>")

-- Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })

-- format code using LSP
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)
