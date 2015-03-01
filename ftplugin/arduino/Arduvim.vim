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

let g:loaded_Arduvim = 1
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
if !exists('g:Arduvim_path')
        echom 'Arduino IDE path not defined'
endif


" --------------------------------
"  Function(s)
" --------------------------------
function! Example()

python << endOfPython
import vim


def printPath():
    path = vim.eval('g:Arduvim_path')
    return path

print(printPath())

endOfPython
endfunction


