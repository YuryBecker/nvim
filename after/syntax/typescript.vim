silent! syntax clear typescriptClassKeyword
silent! syntax clear typescriptIdentifier
silent! syntax clear typescriptVariable
silent! syntax clear typescriptImport
silent! syntax clear typescriptExport
silent! syntax clear typescriptNull
silent! syntax clear typescriptInterfaceKeyword
silent! syntax clear typescriptClassTypeParameter
silent! syntax clear typescriptTypeParameter
silent! syntax clear typescriptTypeReference
silent! syntax clear typescriptType
silent! syntax clear typescriptPrimaryType
silent! syntax clear typescriptObjectType

syntax match typescriptBinaryOp '<=' conceal cchar=≤
syntax match typescriptBinaryOp '>=' conceal cchar=≥
syntax match typescriptBinaryOp '===' conceal cchar=≡
syntax match typescriptBinaryOp '!==' conceal cchar=≢

syntax match typescriptArrowFunc '=>' conceal cchar=→

syntax match typescriptIdentifier 'this' conceal cchar=ṯ
syntax match typescriptIdentifier 'props' conceal cchar=Ꮅ
syntax match typescriptIdentifier 'this\.props' conceal cchar=Ꮲ
syntax match typescriptIdentifier 'this\.state' conceal cchar=Ꮪ

syntax match typescriptIdentifier 'root' conceal cchar=📡
syntax match typescriptIdentifier 'dispatch' conceal cchar=📞

syntax match typescriptIdentifier 'types' conceal cchar=☣

syntax match typescriptIdentifier 'componentDidMount()' conceal cchar=▶️
syntax match typescriptIdentifier 'componentDidUpdate' conceal cchar=🔄
syntax match typescriptIdentifier 'componentWillUnmount()' conceal cchar=🛑

syntax match typescriptVariable 'let' conceal cchar=◻
syntax match typescriptVariable 'const' conceal cchar=◼

syntax match typescriptClassKeyword 'extends' conceal cchar=↝
syntax match typescriptClassKeyword 'extends React.Component' conceal cchar=⚛
syntax match typescriptClassKeyword 'class' conceal cchar=✪
syntax match typescriptClassKeyword 'constructor(' conceal cchar=🍀

syntax match typescriptExport 'export' conceal cchar=⇠
syntax match typescriptExport 'export default' conceal cchar=⇇
syntax match typescriptImport 'import' conceal cchar=⇢
syntax match typescriptImport 'from' conceal cchar=⤅

syntax match typescriptNull 'null' conceal cchar=𝓃

syntax match typescriptInterfaceKeyword 'type' conceal cchar=⚡️
syntax match typescriptInterfaceKeyword 'type\ Props' conceal cchar=🍏
