" --------------------------------
" Add our plugin to the path
" --------------------------------
python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))


" --------------------------------
"  Load Plugin
" --------------------------------

au BufRead,BufNewFile *.ino,*.pde set filetype=arduino

if exists('g:loaded_arduvim')
        finish
endif

let g:loaded_arduvim = 1

" --------------------------------
"  Function(s)
" --------------------------------
function! GetPath()
    let s:arduino_dir = expand('<sfile>:p:h:h')
    let s:arduino_dir_user = expand('<sfile>:p:h:h')
    echom s:arduino_dir
    echom s:arduino_dir_user
endfunction


function! ArduvimGenerate()
python3 << endOfPython
import Arduvim
sys.path.append(vim.eval('expand("<sfile>:h")'))
Arduvim.arduvim()

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! Example call ArduvimGenerate()
