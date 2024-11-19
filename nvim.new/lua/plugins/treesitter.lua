-- lua/config/treesitter.lua

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "html", "css" },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
})

