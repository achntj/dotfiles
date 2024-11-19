-- lua/config/telescope.lua

local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- Telescope setup with default configuration
telescope.setup({
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        preview_width = 0.6,
      },
    },
  },
})


