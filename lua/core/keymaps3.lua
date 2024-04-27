vim.cmd([[

noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

function! BlinkMatch(t)
  let [l:bufnum, l:lnum, l:col, l:off] = getpos('.')
  let l:current = '\c\%#'.@/
  let l:highlight = matchadd('IncSearch', l:current, 1000)
  redraw
  exec 'sleep ' . float2nr(a:t * 1000) . 'm'
  call matchdelete(l:highlight)
  redraw
endfunction


set switchbuf=useopen,usetab,newtab

set viewoptions-=options
set viewoptions=unix,slash


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
  buffer #
else
  bnext
endif

if bufnr("%") == l:currentBufNum
  new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction


for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`' ]
  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

set nowrap
set linebreak
command! W w !sudo tee % > /dev/null


]])
