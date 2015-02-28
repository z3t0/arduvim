" Vim filetype plugin with essentials for Arduino developes
" Maintainer: Rafi Khan





" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

"---------------------------------
"  Load Plugin
"
if exists("g:loaded_Arduvim")
        finish
endif

lef g:loaded_Arduvim = 1

" --------------------------------
"  Function(s)
" --------------------------------
function! Example()

python << endOfPython

from Arduvim import printPath 

print(printPath())

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! Arduvim call Hello()
"---------------------------------
"  Mappings
"---------------------------------


" --------------------------------
"  Variables
" --------------------------------


