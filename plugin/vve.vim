if !has('python3')
    echo "[-] vim seems not to be compiled with python3 support"
    finish
endif

if exists('g:vve_loaded')
    finish
endif

let s:vve_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys, vim, os
vve_root_dir = vim.eval('s:vve_root_dir')
py_root_dir = os.path.normpath(os.path.join(vve_root_dir, '..', 'python'))
sys.path.insert(0, py_root_dir)
EOF

" encoding functions
" nnoremap <leader>ea :set operatorfunc=vve#encode#VisualEncodeAscii<CR>g@
" nnoremap <leader>eb :set operatorfunc=vve#encode#VisualEncodeBinary<CR>g@
" nnoremap <leader>eB :set operatorfunc=vve#encode#VisualEncodeBase64<CR>g@
" nnoremap <leader>ee :set operatorfunc=vve#encode#VisualEncodeHtml<CR>g@
" nnoremap <leader>eE :set operatorfunc=vve#encode#VisualEncodeHtmlFull<CR>g@
" nnoremap <leader>eh :set operatorfunc=vve#encode#VisualEncodeHex<CR>g@
" nnoremap <leader>eH :set operatorfunc=vve#encode#VisualEncodeHexString<CR>g@
" nnoremap <leader>ej :set operatorfunc=vve#encode#VisualEncodeJSON<CR>g@
" nnoremap <leader>eJ :set operatorfunc=vve#encode#VisualEncodeJSONFull<CR>g@
" nnoremap <leader>eu :set operatorfunc=vve#encode#VisualEncodeURL<CR>g@
" nnoremap <leader>eU :set operatorfunc=vve#encode#VisualEncodeURLFull<CR>g@
" nnoremap <leader>ex :set operatorfunc=vve#encode#VisualEncodeXml<CR>g@
" nnoremap <leader>eX :set operatorfunc=vve#encode#VisualEncodeXmlFull<CR>g@
"
" nnoremap <leader>da :set operatorfunc=vve#encode#VisualDecodeAscii<CR>g@
" nnoremap <leader>db :set operatorfunc=vve#encode#VisualDecodeBinary<CR>g@
" nnoremap <leader>dB :set operatorfunc=vve#encode#VisualDecodeBase64<CR>g@
" nnoremap <leader>dh :set operatorfunc=vve#encode#VisualDecodeHex<CR>g@
" nnoremap <leader>dH :set operatorfunc=vve#encode#VisualDecodeHexString<CR>g@
" nnoremap <leader>du :set operatorfunc=vve#encode#VisualDecodeURL<CR>g@
" nnoremap <leader>dU :set operatorfunc=vve#encode#VisualDecodeURLFull<CR>g@
" nnoremap <leader>de :set operatorfunc=vve#encode#VisualDecodeHtml<CR>g@
" nnoremap <leader>dE :set operatorfunc=vve#encode#VisualDecodeHtmlFull<CR>g@
" nnoremap <leader>dj :set operatorfunc=vve#encode#VisualDecodeJSON<CR>g@
" nnoremap <leader>dJ :set operatorfunc=vve#encode#VisualDecodeJSON<CR>g@
" nnoremap <leader>dx :set operatorfunc=vve#encode#VisualDecodeXml<CR>g@
" nnoremap <leader>dX :set operatorfunc=vve#encode#VisualDecodeHtmlFull<CR>g@
"
" nnoremap <leader>Eb :set operatorfunc=vve#encode#VisualEncodeBinaryFromAscii<CR>g@
" nnoremap <leader>EB :set operatorfunc=vve#encode#VisualEncodeBase64FromAscii<CR>g@
" nnoremap <leader>Eh :set operatorfunc=vve#encode#VisualEncodeHexFromAscii<CR>g@
" nnoremap <leader>EH :set operatorfunc=vve#encode#VisualEncodeHexStringFromAscii<CR>g@
" nnoremap <leader>Ee :set operatorfunc=vve#encode#VisualEncodeHtmlFullFromAscii<CR>g@
" nnoremap <leader>EE :set operatorfunc=vve#encode#VisualEncodeHtmlFullFromAscii<CR>g@
" nnoremap <leader>Eu :set operatorfunc=vve#encode#VisualEncodeURLFromAscii<CR>g@
" nnoremap <leader>EU :set operatorfunc=vve#encode#VisualEncodeURLFullFromAscii<CR>g@
" nnoremap <leader>Ex :set operatorfunc=vve#encode#VisualEncodeXmlFullFromAscii<CR>g@
" nnoremap <leader>EX :set operatorfunc=vve#encode#VisualEncodeXmlFullFromAscii<CR>g@
"
" nnoremap <leader>Db :set operatorfunc=vve#encode#VisualDecodeBinaryToAscii<CR>g@
" nnoremap <leader>DB :set operatorfunc=vve#encode#VisualDecodeBase64ToAscii<CR>g@
" nnoremap <leader>Dh :set operatorfunc=vve#encode#VisualDecodeHexToAscii<CR>g@
" nnoremap <leader>DH :set operatorfunc=vve#encode#VisualDecodeHexStringToAscii<CR>g@
" nnoremap <leader>Du :set operatorfunc=vve#encode#VisualDecodeURLToAscii<CR>g@
" nnoremap <leader>DU :set operatorfunc=vve#encode#VisualDecodeURLFullToAscii<CR>g@
" nnoremap <leader>De :set operatorfunc=vve#encode#VisualDecodeHtmlFullToAscii<CR>g@
" nnoremap <leader>DE :set operatorfunc=vve#encode#VisualDecodeHtmlFullToAscii<CR>g@
" nnoremap <leader>Dx :set operatorfunc=vve#encode#VisualDecodeXmlFullToAscii<CR>g@
" nnoremap <leader>DX :set operatorfunc=vve#encode#VisualDecodeXmlFullToAscii<CR>g@
"
" vnoremap <leader>ce :<c-u>ChangeEncoding 
" vnoremap <leader>ea :<c-u>call vve#encode#VisualEncodeAscii(visualmode())<CR>
" vnoremap <leader>eb :<c-u>call vve#encode#VisualEncodeBinary(visualmode())<CR>
" vnoremap <leader>eB :<c-u>call vve#encode#VisualEncodeBase64(visualmode())<CR>
" vnoremap <leader>ee :<c-u>call vve#encode#VisualEncodeHtml(visualmode())<CR>
" vnoremap <leader>eE :<c-u>call vve#encode#VisualEncodeHtmlFull(visualmode())<CR>
" vnoremap <leader>eh :<c-u>call vve#encode#VisualEncodeHex(visualmode())<CR>
" vnoremap <leader>eH :<c-u>call vve#encode#VisualEncodeHexString(visualmode())<CR>
" vnoremap <leader>ej :<c-u>call vve#encode#VisualEncodeJSON(visualmode())<CR>
" vnoremap <leader>eJ :<c-u>call vve#encode#VisualEncodeJSONFull(visualmode())<CR>
" vnoremap <leader>eu :<c-u>call vve#encode#VisualEncodeURL(visualmode())<CR>
" vnoremap <leader>eU :<c-u>call vve#encode#VisualEncodeURLFull(visualmode())<CR>
" vnoremap <leader>ex :<c-u>call vve#encode#VisualEncodeXml(visualmode())<CR>
" vnoremap <leader>eX :<c-u>call vve#encode#VisualEncodeXmlFull(visualmode())<CR>
"
" vnoremap <leader>da :<c-u>call vve#encode#VisualDecodeAscii(visualmode())<CR>
" vnoremap <leader>db :<c-u>call vve#encode#VisualDecodeBinary(visualmode())<CR>
" vnoremap <leader>dB :<c-u>call vve#encode#VisualDecodeBase64(visualmode())<CR>
" vnoremap <leader>dh :<c-u>call vve#encode#VisualDecodeHex(visualmode())<CR>
" vnoremap <leader>dH :<c-u>call vve#encode#VisualDecodeHexString(visualmode())<CR>
" vnoremap <leader>du :<c-u>call vve#encode#VisualDecodeURL(visualmode())<CR>
" vnoremap <leader>dU :<c-u>call vve#encode#VisualDecodeURLFull(visualmode())<CR>
" vnoremap <leader>de :<c-u>call vve#encode#VisualDecodeHtml(visualmode())<CR>
" vnoremap <leader>dE :<c-u>call vve#encode#VisualDecodeHtmlFull(visualmode())<CR>
" vnoremap <leader>dj :<c-u>call vve#encode#VisualDecodeJSON(visualmode())<CR>
" vnoremap <leader>dJ :<c-u>call vve#encode#VisualDecodeJSON(visualmode())<CR>
" vnoremap <leader>dx :<c-u>call vve#encode#VisualDecodeXml(visualmode())<CR>
" vnoremap <leader>dX :<c-u>call vve#encode#VisualDecodeHtmlFull(visualmode())<CR>
"
" vnoremap <leader>Eb :<c-u>call vve#encode#VisualEncodeBinaryFromAscii(visualmode())<CR>
" vnoremap <leader>EB :<c-u>call vve#encode#VisualEncodeBase64FromAscii(visualmode())<CR>
" vnoremap <leader>Eh :<c-u>call vve#encode#VisualEncodeHexFromAscii(visualmode())<CR>
" vnoremap <leader>EH :<c-u>call vve#encode#VisualEncodeHexStringFromAscii(visualmode())<CR>
" vnoremap <leader>Ee :<c-u>call vve#encode#VisualEncodeHtmlFullFromAscii(visualmode())<CR>
" vnoremap <leader>EE :<c-u>call vve#encode#VisualEncodeHtmlFullFromAscii(visualmode())<CR>
" vnoremap <leader>Eu :<c-u>call vve#encode#VisualEncodeURLFromAscii(visualmode())<CR>
" vnoremap <leader>EU :<c-u>call vve#encode#VisualEncodeURLFullFromAscii(visualmode())<CR>
" vnoremap <leader>Ex :<c-u>call vve#encode#VisualEncodeXmlFullFromAscii(visualmode())<CR>
" vnoremap <leader>EX :<c-u>call vve#encode#VisualEncodeXmlFullFromAscii(visualmode())<CR>
"
" vnoremap <leader>Db :<c-u>call vve#encode#VisualDecodeBinaryToAscii(visualmode())<CR>
" vnoremap <leader>DB :<c-u>call vve#encode#VisualDecodeBase64ToAscii(visualmode())<CR>
" vnoremap <leader>Dh :<c-u>call vve#encode#VisualDecodeHexToAscii(visualmode())<CR>
" vnoremap <leader>DH :<c-u>call vve#encode#VisualDecodeHexStringToAscii(visualmode())<CR>
" vnoremap <leader>Du :<c-u>call vve#encode#VisualDecodeURLToAscii(visualmode())<CR>
" vnoremap <leader>DU :<c-u>call vve#encode#VisualDecodeURLFullToAscii(visualmode())<CR>
" vnoremap <leader>De :<c-u>call vve#encode#VisualDecodeHtmlFullToAscii(visualmode())<CR>
" vnoremap <leader>DE :<c-u>call vve#encode#VisualDecodeHtmlFullToAscii(visualmode())<CR>
" vnoremap <leader>Dx :<c-u>call vve#encode#VisualDecodeXmlFullToAscii(visualmode())<CR>
" vnoremap <leader>DX :<c-u>call vve#encode#VisualDecodeXmlFullToAscii(visualmode())<CR>
"
"
" " number conversion and inplace arithmetic
" nnoremap <leader>th :set operatorfunc=vve#numbers#VisualToHex<CR>g@
" nnoremap <leader>tH :set operatorfunc=vve#numbers#VisualToHexString<CR>g@
" nnoremap <leader>tb :set operatorfunc=vve#numbers#VisualToBin<CR>g@
" nnoremap <leader>to :set operatorfunc=vve#numbers#VisualToOct<CR>g@
" nnoremap <leader>td :set operatorfunc=vve#numbers#VisualToDec<CR>g@
" nnoremap <leader>ma :set operatorfunc=vve#numbers#VisualInPlaceAdd<CR>g@
" nnoremap <leader>ms :set operatorfunc=vve#numbers#VisualInPlaceSub<CR>g@
" nnoremap <leader>mm :set operatorfunc=vve#numbers#VisualInPlaceMul<CR>g@
" nnoremap <leader>md :set operatorfunc=vve#numbers#VisualInPlaceDiv<CR>g@
"
" vnoremap <leader>th :<c-u>call vve#numbers#VisualToHex(visualmode())<CR>
" vnoremap <leader>tH :<c-u>call vve#numbers#VisualToHexString(visualmode())<CR>
" vnoremap <leader>tb :<c-u>call vve#numbers#VisualToBin(visualmode())<CR>
" vnoremap <leader>to :<c-u>call vve#numbers#VisualToOct(visualmode())<CR>
" vnoremap <leader>td :<c-u>call vve#numbers#VisualToDec(visualmode())<CR>
" vnoremap <leader>ma :<c-u>call vve#numbers#VisualInPlaceAdd(visualmode())<CR>
" vnoremap <leader>ms :<c-u>call vve#numbers#VisualInPlaceSub(visualmode())<CR>
" vnoremap <leader>mm :<c-u>call vve#numbers#VisualInPlaceMul(visualmode())<CR>
" vnoremap <leader>md :<c-u>call vve#numbers#VisualInPlaceDiv(visualmode())<CR>
"
" " other util functions
" nnoremap <leader>se :set operatorfunc=vve#strings#VisualSwapEndian<CR>g@
" nnoremap <leader>sc :set operatorfunc=vve#strings#VisualLength<CR>g@
" nnoremap <leader>sC :set operatorfunc=vve#strings#VisualLengthHexString<CR>g@
" nnoremap <leader>sn :set operatorfunc=vve#strings#VisualLineLength<CR>g@
" nnoremap <leader>su :set operatorfunc=vve#strings#VisualUpper<CR>g@
" nnoremap <leader>sl :set operatorfunc=vve#strings#VisualLower<CR>g@
" nnoremap <leader>fc :set operatorfunc=vve#strings#VisualCamelCase<CR>g@
" nnoremap <leader>fs :set operatorfunc=vve#strings#VisualSnakeCase<CR>g@
" nnoremap <leader>fm :set operatorfunc=vve#strings#VisualMarkdownAnchor<CR>g@
" nnoremap <leader>fM :set operatorfunc=vve#strings#VisualMarkdownAnchorReference<CR>g@
"
" vnoremap <leader>se :<c-u>call vve#strings#VisualSwapEndian(visualmode())<CR>
" vnoremap <leader>sc :<c-u>call vve#strings#VisualLength(visualmode())<CR>
" vnoremap <leader>sC :<c-u>call vve#strings#VisualLengthHexString(visualmode())<CR>
" vnoremap <leader>su :<c-u>call vve#strings#VisualUpper(visualmode())<CR>
" vnoremap <leader>sl :<c-u>call vve#strings#VisualLower(visualmode())<CR>
" vnoremap <leader>sn :<c-u>call vve#strings#VisualLineLength(visualmode())<CR>
" vnoremap <leader>fc :<c-u>call vve#strings#VisualCamelCase(visualmode())<CR>
" vnoremap <leader>fs :<c-u>call vve#strings#VisualSnakeCase(visualmode())<CR>
" vnoremap <leader>fm :<c-u>call vve#strings#VisualMarkdownAnchor(visualmode())<CR>
" vnoremap <leader>fM :<c-u>call vve#strings#VisualMarkdownAnchorReference(visualmode())<CR>

" rewrite bindings in lua
lua << EOF
function EncodeBase64()
    local current_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(current_buf, 'operatorfunc', 'vve#encode#VisualEncodeBase64')
    vim.api.nvim_feedkeys('g@', 'n', true)
end


vim.api.nvim_command('command! -nargs=0 EncodeBase64 lua EncodeBase64()')

vim.keymap.set('n', '<leader>vqq', [[:set operatorfunc=vve#encode#VisualEncodeAscii<CR>g@]],  { desc = "EncodeAscii"})
vim.keymap.set('n', '<leader>veb', [[:set operatorfunc=vve#encode#VisualEncodeBinary<CR>g@]], { desc = "EncodeBinary"})
vim.keymap.set('n', '<leader>veB', [[:set operatorfunc=vve#encode#VisualEncodeBase64<CR>g@]], { desc = "EncodeBase64"})
vim.keymap.set('n', '<leader>vee', [[:set operatorfunc=vve#encode#VisualEncodeHtml<CR>g@]], { desc = "EncodeHtml"})
vim.keymap.set('n', '<leader>veE', [[:set operatorfunc=vve#encode#VisualEncodeHtmlFull<CR>g@]], { desc = "EncodeHtmlFull"})
vim.keymap.set('n', '<leader>veh', [[:set operatorfunc=vve#encode#VisualEncodeHex<CR>g@]], { desc = "EncodeHex"})
vim.keymap.set('n', '<leader>veH', [[:set operatorfunc=vve#encode#VisualEncodeHexString<CR>g@]], { desc = "EncodeHexString"})
vim.keymap.set('n', '<leader>vej', [[:set operatorfunc=vve#encode#VisualEncodeJSON<CR>g@]], { desc = "EncodeJSON"})
vim.keymap.set('n', '<leader>veJ', [[:set operatorfunc=vve#encode#VisualEncodeJSONFull<CR>g@]], { desc = "EncodeJSONFull"})
vim.keymap.set('n', '<leader>veu', [[:set operatorfunc=vve#encode#VisualEncodeURL<CR>g@]], { desc = "EncodeURL"})
vim.keymap.set('n', '<leader>veU', [[:set operatorfunc=vve#encode#VisualEncodeURLFull<CR>g@]], { desc = "EncodeURLFull"})
vim.keymap.set('n', '<leader>vex', [[:set operatorfunc=vve#encode#VisualEncodeXml<CR>g@]], { desc = "EncodeXml"})
vim.keymap.set('n', '<leader>veX', [[:set operatorfunc=vve#encode#VisualEncodeXmlFull<CR>g@]], { desc = "EncodeXmlFull"})

vim.keymap.set('n', '<leader>vda', [[:set operatorfunc=vve#encode#VisualDecodeAscii<CR>g@]], { desc = "DecodeAscii"})
vim.keymap.set('n', '<leader>vdb', [[:set operatorfunc=vve#encode#VisualDecodeBinary<CR>g@]], { desc = "DecodeBinary"})
vim.keymap.set('n', '<leader>vdB', [[:set operatorfunc=vve#encode#VisualDecodeBase64<CR>g@]], { desc = "DecodeBase64"})
vim.keymap.set('n', '<leader>vdh', [[:set operatorfunc=vve#encode#VisualDecodeHex<CR>g@]], { desc = "DecodeHex"})
vim.keymap.set('n', '<leader>vdH', [[:set operatorfunc=vve#encode#VisualDecodeHexString<CR>g@]], { desc = "DecodeHexString"})
vim.keymap.set('n', '<leader>vdu', [[:set operatorfunc=vve#encode#VisualDecodeURL<CR>g@]], { desc = "DecodeURL"})
vim.keymap.set('n', '<leader>vdU', [[:set operatorfunc=vve#encode#VisualDecodeURLFull<CR>g@]], { desc = "DecodeURLFull"})
vim.keymap.set('n', '<leader>vde', [[:set operatorfunc=vve#encode#VisualDecodeHtml<CR>g@]], { desc = "DecodeHtml"})
vim.keymap.set('n', '<leader>vdE', [[:set operatorfunc=vve#encode#VisualDecodeHtmlFull<CR>g@]], { desc = "DecodeHtmlFull"})
vim.keymap.set('n', '<leader>vdj', [[:set operatorfunc=vve#encode#VisualDecodeJSON<CR>g@]], { desc = "DecodeJSON"})
vim.keymap.set('n', '<leader>vdJ', [[:set operatorfunc=vve#encode#VisualDecodeJSON<CR>g@]], { desc = "DecodeJSON"})
vim.keymap.set('n', '<leader>vdx', [[:set operatorfunc=vve#encode#VisualDecodeXml<CR>g@]], { desc = "DecodeXml"})
vim.keymap.set('n', '<leader>vdX', [[:set operatorfunc=vve#encode#VisualDecodeHtmlFull<CR>g@]], { desc = "DecodeHtmlFull"})

vim.keymap.set('n', '<leader>vEb', [[:set operatorfunc=vve#encode#VisualEncodeBinaryFromAscii<CR>g@]], { desc = "EncodeBinaryFromAscii"})
vim.keymap.set('n', '<leader>vEB', [[:set operatorfunc=vve#encode#VisualEncodeBase64FromAscii<CR>g@]], { desc = "EncodeBase64FromAscii"})
vim.keymap.set('n', '<leader>vEh', [[:set operatorfunc=vve#encode#VisualEncodeHexFromAscii<CR>g@]], { desc = "EncodeHexFromAscii"})
vim.keymap.set('n', '<leader>vEH', [[:set operatorfunc=vve#encode#VisualEncodeHexStringFromAscii<CR>g@]], { desc = "EncodeHexStringFromAscii"})
vim.keymap.set('n', '<leader>vEe', [[:set operatorfunc=vve#encode#VisualEncodeHtmlFullFromAscii<CR>g@]], { desc = "EncodeHtmlFullFromAscii"})
vim.keymap.set('n', '<leader>vEE', [[:set operatorfunc=vve#encode#VisualEncodeHtmlFullFromAscii<CR>g@]], { desc = "EncodeHtmlFullFromAscii"})
vim.keymap.set('n', '<leader>vEu', [[:set operatorfunc=vve#encode#VisualEncodeURLFromAscii<CR>g@]], { desc = "EncodeURLFromAscii"})
vim.keymap.set('n', '<leader>vEU', [[:set operatorfunc=vve#encode#VisualEncodeURLFullFromAscii<CR>g@]], { desc = "EncodeURLFullFromAscii"})
vim.keymap.set('n', '<leader>vEx', [[:set operatorfunc=vve#encode#VisualEncodeXmlFullFromAscii<CR>g@]], { desc = "EncodeXmlFullFromAscii"})
vim.keymap.set('n', '<leader>vEX', [[:set operatorfunc=vve#encode#VisualEncodeXmlFullFromAscii<CR>g@]], { desc = "EncodeXmlFullFromAscii"})

vim.keymap.set('n', '<leader>vDb', [[:set operatorfunc=vve#encode#VisualDecodeBinaryToAscii<CR>g@]], { desc = "DecodeBinaryToAscii"})
vim.keymap.set('n', '<leader>vDB', [[:set operatorfunc=vve#encode#VisualDecodeBase64ToAscii<CR>g@]], { desc = "DecodeBase64ToAscii"})
vim.keymap.set('n', '<leader>vDh', [[:set operatorfunc=vve#encode#VisualDecodeHexToAscii<CR>g@]], { desc = "DecodeHexToAscii"})
vim.keymap.set('n', '<leader>vDH', [[:set operatorfunc=vve#encode#VisualDecodeHexStringToAscii<CR>g@]], { desc = "DecodeHexStringToAscii"})
vim.keymap.set('n', '<leader>vDu', [[:set operatorfunc=vve#encode#VisualDecodeURLToAscii<CR>g@]], { desc = "DecodeURLToAscii"})
vim.keymap.set('n', '<leader>vDU', [[:set operatorfunc=vve#encode#VisualDecodeURLFullToAscii<CR>g@]], { desc = "DecodeURLFullToAscii"})
vim.keymap.set('n', '<leader>vDe', [[:set operatorfunc=vve#encode#VisualDecodeHtmlFullToAscii<CR>g@]], { desc = "DecodeHtmlFullToAscii"})
vim.keymap.set('n', '<leader>vDE', [[:set operatorfunc=vve#encode#VisualDecodeHtmlFullToAscii<CR>g@]], { desc = "DecodeHtmlFullToAscii"})
vim.keymap.set('n', '<leader>vDx', [[:set operatorfunc=vve#encode#VisualDecodeXmlFullToAscii<CR>g@]], { desc = "DecodeXmlFullToAscii"})
vim.keymap.set('n', '<leader>vDX', [[:set operatorfunc=vve#encode#VisualDecodeXmlFullToAscii<CR>g@]], { desc = "DecodeXmlFullToAscii"})

vim.keymap.set('v', '<leader>vce', [[:<c-u>ChangeEncoding ]], { desc = "ChangeEncoding"})
vim.keymap.set('v', '<leader>vea', [[:<c-u>call vve#encode#VisualEncodeAscii(visualmode())<CR>]], { desc = "EncodeAscii"})
vim.keymap.set('v', '<leader>veb', [[:<c-u>call vve#encode#VisualEncodeBinary(visualmode())<CR>]], { desc = "EncodeBinary"})
vim.keymap.set('v', '<leader>veB', [[:<c-u>call vve#encode#VisualEncodeBase64(visualmode())<CR>]], { desc = "EncodeBase64"})
vim.keymap.set('v', '<leader>vee', [[:<c-u>call vve#encode#VisualEncodeHtml(visualmode())<CR>]], { desc = "EncodeHtml"})
vim.keymap.set('v', '<leader>veE', [[:<c-u>call vve#encode#VisualEncodeHtmlFull(visualmode())<CR>]], { desc = "EncodeHtmlFull"})
vim.keymap.set('v', '<leader>veh', [[:<c-u>call vve#encode#VisualEncodeHex(visualmode())<CR>]], { desc = "EncodeHex"})
vim.keymap.set('v', '<leader>veH', [[:<c-u>call vve#encode#VisualEncodeHexString(visualmode())<CR>]], { desc = "EncodeHexString"})
vim.keymap.set('v', '<leader>vej', [[:<c-u>call vve#encode#VisualEncodeJSON(visualmode())<CR>]], { desc = "EncodeJSON"})
vim.keymap.set('v', '<leader>veJ', [[:<c-u>call vve#encode#VisualEncodeJSONFull(visualmode())<CR>]], { desc = "EncodeJSONFull"})
vim.keymap.set('v', '<leader>veu', [[:<c-u>call vve#encode#VisualEncodeURL(visualmode())<CR>]], { desc = "EncodeURL"})
vim.keymap.set('v', '<leader>veU', [[:<c-u>call vve#encode#VisualEncodeURLFull(visualmode())<CR>]], { desc = "EncodeURLFull"})
vim.keymap.set('v', '<leader>vex', [[:<c-u>call vve#encode#VisualEncodeXml(visualmode())<CR>]], { desc = "EncodeXml"})
vim.keymap.set('v', '<leader>veX', [[:<c-u>call vve#encode#VisualEncodeXmlFull(visualmode())<CR>]], { desc = "EncodeXmlFull"})

vim.keymap.set('v', '<leader>vda', [[:<c-u>call vve#encode#VisualDecodeAscii(visualmode())<CR>]], { desc = "DecodeAscii"})
vim.keymap.set('v', '<leader>vdb', [[:<c-u>call vve#encode#VisualDecodeBinary(visualmode())<CR>]], { desc = "DecodeBinary"})
vim.keymap.set('v', '<leader>vdB', [[:<c-u>call vve#encode#VisualDecodeBase64(visualmode())<CR>]], { desc = "DecodeBase64"})
vim.keymap.set('v', '<leader>vdh', [[:<c-u>call vve#encode#VisualDecodeHex(visualmode())<CR>]], { desc = "DecodeHex"})
vim.keymap.set('v', '<leader>vdH', [[:<c-u>call vve#encode#VisualDecodeHexString(visualmode())<CR>]], { desc = "DecodeHexString"})
vim.keymap.set('v', '<leader>vdu', [[:<c-u>call vve#encode#VisualDecodeURL(visualmode())<CR>]], { desc = "DecodeURL"})
vim.keymap.set('v', '<leader>vdU', [[:<c-u>call vve#encode#VisualDecodeURLFull(visualmode())<CR>]], { desc = "DecodeURLFull"})
vim.keymap.set('v', '<leader>vde', [[:<c-u>call vve#encode#VisualDecodeHtml(visualmode())<CR>]], { desc = "DecodeHtml"})
vim.keymap.set('v', '<leader>vdE', [[:<c-u>call vve#encode#VisualDecodeHtmlFull(visualmode())<CR>]], { desc = "DecodeHtmlFull"})
vim.keymap.set('v', '<leader>vdj', [[:<c-u>call vve#encode#VisualDecodeJSON(visualmode())<CR>]], { desc = "DecodeJSON"})
vim.keymap.set('v', '<leader>vdJ', [[:<c-u>call vve#encode#VisualDecodeJSON(visualmode())<CR>]], { desc = "DecodeJSON"})
vim.keymap.set('v', '<leader>vdx', [[:<c-u>call vve#encode#VisualDecodeXml(visualmode())<CR>]], { desc = "DecodeXml"})
vim.keymap.set('v', '<leader>vdX', [[:<c-u>call vve#encode#VisualDecodeHtmlFull(visualmode())<CR>]], { desc = "DecodeHtmlFull"})

vim.keymap.set('v', '<leader>vEb', [[:<c-u>call vve#encode#VisualEncodeBinaryFromAscii(visualmode())<CR>]], { desc = "EncodeBinaryFromAscii"})
vim.keymap.set('v', '<leader>vEB', [[:<c-u>call vve#encode#VisualEncodeBase64FromAscii(visualmode())<CR>]], { desc = "EncodeBase64FromAscii"})
vim.keymap.set('v', '<leader>vEh', [[:<c-u>call vve#encode#VisualEncodeHexFromAscii(visualmode())<CR>]], { desc = "EncodeHexFromAscii"})
vim.keymap.set('v', '<leader>vEH', [[:<c-u>call vve#encode#VisualEncodeHexStringFromAscii(visualmode())<CR>]], { desc = "EncodeHexStringFromAscii"})
vim.keymap.set('v', '<leader>vEe', [[:<c-u>call vve#encode#VisualEncodeHtmlFullFromAscii(visualmode())<CR>]], { desc = "EncodeHtmlFullFromAscii"})
vim.keymap.set('v', '<leader>vEE', [[:<c-u>call vve#encode#VisualEncodeHtmlFullFromAscii(visualmode())<CR>]], { desc = "EncodeHtmlFullFromAscii"})
vim.keymap.set('v', '<leader>vEu', [[:<c-u>call vve#encode#VisualEncodeURLFromAscii(visualmode())<CR>]], { desc = "EncodeURLFromAscii"})
vim.keymap.set('v', '<leader>vEU', [[:<c-u>call vve#encode#VisualEncodeURLFullFromAscii(visualmode())<CR>]], { desc = "EncodeURLFullFromAscii"})
vim.keymap.set('v', '<leader>vEx', [[:<c-u>call vve#encode#VisualEncodeXmlFullFromAscii(visualmode())<CR>]], { desc = "EncodeXmlFullFromAscii"})
vim.keymap.set('v', '<leader>vEX', [[:<c-u>call vve#encode#VisualEncodeXmlFullFromAscii(visualmode())<CR>]], { desc = "EncodeXmlFullFromAscii"})

vim.keymap.set('v', '<leader>vDb', [[:<c-u>call vve#encode#VisualDecodeBinaryToAscii(visualmode())<CR>]], { desc = "DecodeBinaryToAscii"})
vim.keymap.set('v', '<leader>vDB', [[:<c-u>call vve#encode#VisualDecodeBase64ToAscii(visualmode())<CR>]], { desc = "DecodeBase64ToAscii"})
vim.keymap.set('v', '<leader>vDh', [[:<c-u>call vve#encode#VisualDecodeHexToAscii(visualmode())<CR>]], { desc = "DecodeHexToAscii"})
vim.keymap.set('v', '<leader>vDH', [[:<c-u>call vve#encode#VisualDecodeHexStringToAscii(visualmode())<CR>]], { desc = "DecodeHexStringToAscii"})
vim.keymap.set('v', '<leader>vDu', [[:<c-u>call vve#encode#VisualDecodeURLToAscii(visualmode())<CR>]], { desc = "DecodeURLToAscii"})
vim.keymap.set('v', '<leader>vDU', [[:<c-u>call vve#encode#VisualDecodeURLFullToAscii(visualmode())<CR>]], { desc = "DecodeURLFullToAscii"})
vim.keymap.set('v', '<leader>vDe', [[:<c-u>call vve#encode#VisualDecodeHtmlFullToAscii(visualmode())<CR>]], { desc = "DecodeHtmlFullToAscii"})
vim.keymap.set('v', '<leader>vDE', [[:<c-u>call vve#encode#VisualDecodeHtmlFullToAscii(visualmode())<CR>]], { desc = "DecodeHtmlFullToAscii"})
vim.keymap.set('v', '<leader>vDx', [[:<c-u>call vve#encode#VisualDecodeXmlFullToAscii(visualmode())<CR>]], { desc = "DecodeXmlFullToAscii"})
vim.keymap.set('v', '<leader>vDX', [[:<c-u>call vve#encode#VisualDecodeXmlFullToAscii(visualmode())<CR>]], { desc = "DecodeXmlFullToAscii"})


vim.keymap.set('n', '<leader>vth', [[:set operatorfunc=vve#numbers#VisualToHex<CR>g@]], { desc = "ToHex"})
vim.keymap.set('n', '<leader>vtH', [[:set operatorfunc=vve#numbers#VisualToHexString<CR>g@]], { desc = "ToHexString"})
vim.keymap.set('n', '<leader>vtb', [[:set operatorfunc=vve#numbers#VisualToBin<CR>g@]], { desc = "ToBin"})
vim.keymap.set('n', '<leader>vto', [[:set operatorfunc=vve#numbers#VisualToOct<CR>g@]], { desc = "ToOct"})
vim.keymap.set('n', '<leader>vtd', [[:set operatorfunc=vve#numbers#VisualToDec<CR>g@]], { desc = "ToDec"})
vim.keymap.set('n', '<leader>vma', [[:set operatorfunc=vve#numbers#VisualInPlaceAdd<CR>g@]], { desc = "InPlaceAdd"})
vim.keymap.set('n', '<leader>vms', [[:set operatorfunc=vve#numbers#VisualInPlaceSub<CR>g@]], { desc = "InPlaceSub"})
vim.keymap.set('n', '<leader>vmm', [[:set operatorfunc=vve#numbers#VisualInPlaceMul<CR>g@]], { desc = "InPlaceMul"})
vim.keymap.set('n', '<leader>vmd', [[:set operatorfunc=vve#numbers#VisualInPlaceDiv<CR>g@]], { desc = "InPlaceDiv"})

vim.keymap.set('v', '<leader>vth', [[:<c-u>call vve#numbers#VisualToHex(visualmode())<CR>]], { desc = "ToHex"})
vim.keymap.set('v', '<leader>vtH', [[:<c-u>call vve#numbers#VisualToHexString(visualmode())<CR>]], { desc = "ToHexString"})
vim.keymap.set('v', '<leader>vtb', [[:<c-u>call vve#numbers#VisualToBin(visualmode())<CR>]], { desc = "ToBin"})
vim.keymap.set('v', '<leader>vto', [[:<c-u>call vve#numbers#VisualToOct(visualmode())<CR>]], { desc = "ToOct"})
vim.keymap.set('v', '<leader>vtd', [[:<c-u>call vve#numbers#VisualToDec(visualmode())<CR>]], { desc = "ToDec"})
vim.keymap.set('v', '<leader>vma', [[:<c-u>call vve#numbers#VisualInPlaceAdd(visualmode())<CR>]], { desc = "InPlaceAdd"})
vim.keymap.set('v', '<leader>vms', [[:<c-u>call vve#numbers#VisualInPlaceSub(visualmode())<CR>]], { desc = "InPlaceSub"})
vim.keymap.set('v', '<leader>vmm', [[:<c-u>call vve#numbers#VisualInPlaceMul(visualmode())<CR>]], { desc = "InPlaceMul"})
vim.keymap.set('v', '<leader>vmd', [[:<c-u>call vve#numbers#VisualInPlaceDiv(visualmode())<CR>]], { desc = "InPlaceDiv"})

vim.keymap.set('n', '<leader>vse', [[:set operatorfunc=vve#strings#VisualSwapEndian<CR>g@]], { desc = "SwapEndian"})
vim.keymap.set('n', '<leader>vsc', [[:set operatorfunc=vve#strings#VisualLength<CR>g@]], { desc = "Length"})
vim.keymap.set('n', '<leader>vsC', [[:set operatorfunc=vve#strings#VisualLengthHexString<CR>g@]], { desc = "LengthHexString"})
vim.keymap.set('n', '<leader>vsn', [[:set operatorfunc=vve#strings#VisualLineLength<CR>g@]], { desc = "LineLength"})
vim.keymap.set('n', '<leader>vsu', [[:set operatorfunc=vve#strings#VisualUpper<CR>g@]], { desc = "Upper"})
vim.keymap.set('n', '<leader>vsl', [[:set operatorfunc=vve#strings#VisualLower<CR>g@]], { desc = "Lower"})
vim.keymap.set('n', '<leader>vfc', [[:set operatorfunc=vve#strings#VisualCamelCase<CR>g@]], { desc = "CamelCase"})
vim.keymap.set('n', '<leader>vfs', [[:set operatorfunc=vve#strings#VisualSnakeCase<CR>g@]], { desc = "SnakeCase"})
vim.keymap.set('n', '<leader>vfm', [[:set operatorfunc=vve#strings#VisualMarkdownAnchor<CR>g@]], { desc = "MarkdownAnchor"})
vim.keymap.set('n', '<leader>vfM', [[:set operatorfunc=vve#strings#VisualMarkdownAnchorReference<CR>g@]], { desc = "MarkdownAnchorReference"})

vim.keymap.set('v', '<leader>vse', [[:<c-u>call vve#strings#VisualSwapEndian(visualmode())<CR>]], { desc = "SwapEndian"})
vim.keymap.set('v', '<leader>vsc', [[:<c-u>call vve#strings#VisualLength(visualmode())<CR>]], { desc = "Length"})
vim.keymap.set('v', '<leader>vsC', [[:<c-u>call vve#strings#VisualLengthHexString(visualmode())<CR>]], { desc = "LengthHexString"})
vim.keymap.set('v', '<leader>vsu', [[:<c-u>call vve#strings#VisualUpper(visualmode())<CR>]], { desc = "Upper"})
vim.keymap.set('v', '<leader>vsl', [[:<c-u>call vve#strings#VisualLower(visualmode())<CR>]], { desc = "Lower"})
vim.keymap.set('v', '<leader>vsn', [[:<c-u>call vve#strings#VisualLineLength(visualmode())<CR>]], { desc = "LineLength"})
vim.keymap.set('v', '<leader>vfc', [[:<c-u>call vve#strings#VisualCamelCase(visualmode())<CR>]], { desc = "CamelCase"})
vim.keymap.set('v', '<leader>vfs', [[:<c-u>call vve#strings#VisualSnakeCase(visualmode())<CR>]], { desc = "SnakeCase"})
vim.keymap.set('v', '<leader>vfm', [[:<c-u>call vve#strings#VisualMarkdownAnchor(visualmode())<CR>]], { desc = "MarkdownAnchor"})
vim.keymap.set('v', '<leader>vfM', [[:<c-u>call vve#strings#VisualMarkdownAnchorReference(visualmode())<CR>]], { desc = "MarkdownAnchorReference"})
EOF


" some util commands
command! -nargs=1 -complete=file InsertFile :exec "normal i" . fnamemodify(<q-args>, ":t") . "\<esc>"
command! -nargs=1 -complete=file AppendFile :exec "normal a" . fnamemodify(<q-args>, ":t") . "\<esc>"
command! -nargs=1 -complete=file InsertPath :exec "normal i" . <q-args> . "\<esc>"
command! -nargs=1 -complete=file AppendPath :exec "normal a" . <q-args> . "\<esc>"
command! -nargs=+ -complete=custom,vve#encode#ListEncodings ChangeEncoding :call vve#encode#VisualChangeEncoding(<f-args>, visualmode())

let g:vve_loaded = 1
