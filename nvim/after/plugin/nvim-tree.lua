-- global
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>",
  { silent = true, noremap = true })

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  local function open_tab_silent(node)
    api.node.open.tab(node)
    vim.cmd.tabprev()
  end

  local function open_nvim_tree()
    -- open the tree
    api.tree.open()
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 't', open_tab_silent, opts('Open Tab Silent'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  -- auto-open tree on start
  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end

-- pass to setup along with other optiono
require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort_by = 'extension',
  view = {
    width = 30,
    side = "right",
  },
  git = {
    ignore = false,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
