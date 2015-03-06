" Vim syntax file
" Language:    Arduino
" Maintainer:  Rafi Khan <zetoslab@gmail.com>
" Last Change: 03 March 2015

" Rafi Khan Copyright (c) 2015

" Syntax highlighting like in the Arduino IDE 
" From version: unknown


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/cpp.vim
endif




hi def link arduinoType Type
hi def link arduinoConstant Constant
hi def link arduinoStdFunc Function
hi def link arduinoFunc Function
hi def link arduinoMethod Function
hi def link arduinoIdentifier Identifier
hi def link arduinoOperator Operator

hi def link arduinoLibraryType Type
hi def link arduinoLibraryConstant Constant
hi def link arduinoLibraryStdFunc Function
hi def link arduinoLibraryFunc Function
hi def link arduinoLibraryMethod Function
hi def link arduinoLibraryIdentifier Identifier
hi def link arduinoLibraryOperator Operator
