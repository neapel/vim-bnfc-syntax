" Vim syntax file
" Language: The BNF Converter grammar http://bnfc.digitalgrammars.com
" URL: <https://github.com/neapel/vim-bnfc-syntax/>
" Maintainer: Pascal Germroth <pascal@ensieve.org>

if exists("b:current_syntax")
"  finish
endif

" operators

syn match bnfcOperator /*\|+\|?\||\|::=/
hi def link bnfcOperator Operator

syn match bnfcLabel /[^ ]\+ *\./
hi def link bnfcLabel Identifier


" comment
syn keyword bnfcTodo FIXME NOTE NOTES TODO XXX contained
hi def link bnfcTodo Todo

syn match bnfcComment /--.*$/ contains=bnfcTodo,@Spell
syn region bnfcComment start=/{-/ end=/-}/ contains=bnfcTodo,@Spell
hi def link bnfcComment Comment


" reserved words
syn keyword bnfcStm comment token entrypoints separator terminator coercions
							\ rules layout
hi def link bnfcStm Statement
							
syn keyword bnfcMod internal position stop toplevel nonempty
hi def link bnfcMod Type

syn keyword bnfcClass eps digit letter lower upper char           
hi def link bnfcClass PreProc

" literals
syn match bnfcStringEscape /\\./ contained
hi def link bnfcStringEscape Special

syn region bnfcString start=/"/ skip=/\\\\\|\\"/ end=/"/ keepend
					\ contains=bnfcStringEscape,@Spell
hi def link bnfcString String

syn match bnfcCharacter /'.'/ contains=bnfcStringEscape
hi def link bnfcCharacter Character

syn match bnfcInteger /\d\+/
hi def link bnfcInteger Number



let b:current_syntax = "bnfc"
