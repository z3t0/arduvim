" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))


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
    echom s:arduino_dir
endfunction


function! TemplateExample()
python << endOfPython
import arduvim
sys.path.append(vim.eval('expand("<sfile>:h")'))
arduvim.arduvim()

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! Example call TemplateExample()
