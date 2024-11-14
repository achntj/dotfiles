-- Coc nvim config

-- global extensions
vim.g.coc_global_extensions = {
	"coc-tsserver",
	"coc-css",
	"coc-html",
	"coc-emmet",
	"coc-json",
	"coc-go",
	"coc-snippets",
	"coc-prettier",
	"coc-lua",
	"coc-clangd",
}


vim.cmd([[
	 function! s:check_back_space() abort
	   let col = col('.') - 1
	   return !col || getline('.')[col - 1]  =~# '\s'
	 endfunction

	 inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	 inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
	 " remap for complete to use tab and <cr>
	 inoremap <silent><expr> <TAB>
		   \ coc#pum#visible() ? coc#pum#next(1):
		   \ <SID>check_back_space() ? "\<Tab>" :
		   \ coc#refresh()
	 inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	 inoremap <silent><expr> <c-space> coc#refresh()

	 hi CocSearch ctermfg=12 guifg=#18A3FF
	 hi CocMenuSel ctermbg=109 guibg=#13354A

	 " GoTo code navigation
	 nmap <silent> gd <Plug>(coc-definition)
	 nmap <silent> gy <Plug>(coc-type-definition)
	 nmap <silent> gi <Plug>(coc-implementation)
     nmap <silent> gr <Plug>(coc-references)

	 " Use `[g` and `]g` to navigate diagnostics
	 " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	 nmap <silent> [g <Plug>(coc-diagnostic-prev)
	 nmap <silent> ]g <Plug>(coc-diagnostic-next)
]])
