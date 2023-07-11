-- cpp template
vim.cmd [[
:autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/template.cpp
]]

vim.cmd [[
  " F5 to compile and F6 to run, C++
  autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 % -o %:r -Wall<CR>
  autocmd filetype cpp nnoremap <F6> :tab term ./%:r<CR>
]]


-- C++ Class Generator
vim.cmd [[
 function! Class(ClassName)
    "==================  editing header file =====================
     let header = a:ClassName.".h"
     :vsp %:h/.h
     call append(0,"#ifndef ".toupper(a:ClassName)."_H")
     call append(1,"#define ".toupper(a:ClassName)."_H")
     call append(2," ")
     call append(3,"class ".a:ClassName )
     call append(4, "{")
     call append(5, "   public:")
     call append(6, "      ".a:ClassName."();")
     " call append(7, "      virtual ~".a:ClassName."();")
     call append(8, "   protected:")
     call append(9, "   private:")
     call append(10, "};")
     call append(11,"#endif // ".toupper(a:ClassName)."_H")
     :execute 'write' header
   "================== editing source file ========================
     let src    = a:ClassName.".cpp"
     :vsp %:h/.cpp
     call append(0,"#include ".a:ClassName.".h")
     call append(1," ")
     call append(2,a:ClassName."::".a:ClassName."()")
     call append(3,"{")
     call append(4,"//ctor ")
     call append(5,"}")
     call append(6," ")
     call append(7," ")
     call append(8,a:ClassName."::~".a:ClassName."()")
     call append(9,"{")
     call append(10,"//dtor ")
     call append(11,"}")
     :execute 'write' src
endfunction
]]
