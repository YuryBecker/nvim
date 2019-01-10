" Remove the keywords. We'll re-add them below. Use silent in case the group
" doesn't exist.
silent! syntax clear jsClassKeyword
silent! syntax clear jsExport
silent! syntax clear jsExtendsKeyword
silent! syntax clear jsFuncArgs
silent! syntax clear jsImport
silent! syntax clear jsNull
silent! syntax clear jsRestExpression
silent! syntax clear jsRestOperator
silent! syntax clear jsSpreadOperator
silent! syntax clear jsStorageClass
silent! syntax clear jsThis
silent! syntax clear jsVariableDef


" syntax match pyOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬

" Subscripts


" Matches x0 -> x₀ A2 -> A₂ word2 -> word₂
" Use ms=s+1 to avoid concealing the letter before the number
syntax match Normal '\v<[[:alpha:]_]+0>'ms=e conceal cchar=₀
syntax match Normal '\v<[[:alpha:]_]+1>'ms=e conceal cchar=₁
syntax match Normal '\v<[[:alpha:]_]+2>'ms=e conceal cchar=₂
syntax match Normal '\v<[[:alpha:]_]+3>'ms=e conceal cchar=₃
syntax match Normal '\v<[[:alpha:]_]+4>'ms=e conceal cchar=₄
syntax match Normal '\v<[[:alpha:]_]+5>'ms=e conceal cchar=₅
syntax match Normal '\v<[[:alpha:]_]+6>'ms=e conceal cchar=₆
syntax match Normal '\v<[[:alpha:]_]+7>'ms=e conceal cchar=₇
syntax match Normal '\v<[[:alpha:]_]+8>'ms=e conceal cchar=₈
syntax match Normal '\v<[[:alpha:]_]+9>'ms=e conceal cchar=₉


syntax match Normal 'sv' conceal cchar=→

syntax match Normal '<=' conceal cchar=≤
syntax match Normal '>=' conceal cchar=≥

syntax match jsThis 'this' conceal cchar=ṯ
syntax match jsThis 'props' conceal cchar=Ꮅ
syntax match jsThis 'this\.props' conceal cchar=Ꮲ
syntax match jsThis 'this\.state' conceal cchar=Ꮪ

syntax match jsExtendsKeyword 'extends' conceal cchar=↝
syntax match jsExtendsKeyword 'extends React.Component' conceal cchar=⚛
syntax match jsClassKeyword 'class' conceal cchar=✪

syntax match jsFunction 'export' conceal cchar=⇠
syntax match jsExport 'export default' conceal cchar=⇇
syntax match jsImport 'import' conceal cchar=⇢
syntax match jsImport 'from' conceal cchar=⤅

syntax match jsVariableDef 'const' conceal cchar=⏺
syntax match jsVariableDef 'let' conceal cchar=⚪

syntax match jsOperator '===' conceal cchar=≡
syntax match jsOperator '!==' conceal cchar=≢

syntax match jsNull 'null' conceal cchar=𝓃


highlight! link Conceal Operator
