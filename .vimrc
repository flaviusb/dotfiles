filetype off 
call pathogen#infect("bundle/{}") 
call pathogen#helptags()

filetype plugin indent on

" Some gentoo devs are smarmy shits, so we have to do this
let g:leave_my_textwidth_alone=1
" Note for the future: run this command to see where eg &tw is set
" :verbose set tw?

set nocompatible

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set textwidth=0 wrapmargin=0
let g:rust_recommended_style=0

nnoremap / /\v
vnoremap / /\v

" This is for logic
map! <F2> □
map! <S-F2> ◊
map! <F3> ∀
map! <S-F3> ∃
map! <F4> ⊃

" This is for programming in atomish
map! <Leader>not ¬
map! <Leader>~   ¬
map! <Leader>^   ∧
map! <Leader>v   ∨
map! <Leader>implies ⊃
map! <Leader>proves ⊢
map! <Leader>therefore ⊨
map! <Leader>u   ∪
map! <Leader>n   ∩
map! <Leader>++  ⧺
map! <Leader>+++ ⧻
map! <Leader>->  →
map! <Leader><-  ←
map! <Leader>=>  ⇒
map! <Leader><=  ⇐
map! <Leader>.   ∘
map! <Leader>flip ·
map! <Leader>dot •
map! <Leader>*   ×
map! <leader>//  ※
map! <Leader>/   ÷
map! <Leader>star ★
map! <Leader>;   §
"map! <Leader>:   
map! <Leader>l   λ
map! <Leader>dp  Π
map! <Leader>ds  Σ
map! <Leader>... …
map! <Leader>in  ∈
map! <Leader>ni  ∋
map! <Leader>nin ∉
map! <Leader>nni ∌
map! <Leader>=   ≠
map! <Leader>==  ≡
map! <Leader>!== ≢
map! <Leader>!~= ≇
map! <Leader>?   ؟
map! <Leader><<  «
map! <Leader>>>  »
map! <Leader>-o  ⊸
map! <Leader>lollipop  ⊸

map! <leader>a  ∀
map! <leader>forall  ∀
map! <leader>e  ∃
map! <leader>exists  ∃
map! <leader>(  ⦇
map! <leader>)  ⦈
map! <leader>mu μ
map! <leader>nu ν
map! <leader>pa Ϙ
map! <leader>da 𐌎
map! <leader>i  ı
map! <leader>fresh  ı
map! <leader>ul ⌜
map! <leader>ur ⌝
map! <leader>bot ⊥
map! <leader>top ⊤
noremap! <leader>\  \
map! <leader>eq ≃
map! <leader>store ↤
map! <leader>+ ⊞
map! <leader>- ⊟


nnoremap <F8> :FriendsTwitter<cr>

function! OpenLink()
  exe "normal ? \<CR> v/ \<CR>y\<CR>"
  exe ':!firefox '.@0
endfunction

function! OneOneFortyIfy()
  if strlen(getline(".")) > 138
    exe ":s/\\v(.{1,138}(\>\|[. ,]))/\"…\\1…\" \\\\\r/"
    exe "|j"
    call OneOneFortyIfy()
  else
    exe ":s/\\v(.{1,139}(\>\|$))/\"…\\1\"/"
  endif
endfunction

function! OneFortyIfy()
  exe "normal |"
  exe ":s/\\v(.{1,139}(\>\|[. ,]))/\"\\1…\" \\\\\r/"
  exe "|j"
  call OneOneFortyIfy()
endfunction

function! PreAtomishExec()
  let line=shellescape(getline("."))
  :echo system("preatomish -e " . line)
endfunction
nmap <Leader>z :call PreAtomishExec()<CR>

function! PreAtomishExecR() range
  let line=shellescape(join(getline(a:firstline, a:lastline), "\n"), 1)
  :echo line
  :exe "!preatomish -e " . line
endfunction
vmap <Leader>z :call PreAtomishExecR()<CR>

nmap <silent> <Leader>] :call OpenLink()<CR>

let twitvim_count=70
let twitvim_browser_cmd="firefox"
let twitvim_force_ssl = 1

let addfoo=5
nnoremap <Leader>l dw"=(@@+addfoo)<CR>P

au BufRead,BufNewFile *.md set filetype=markdown

"command! -range Atom execute '!preatomish.sh '.<q-args>

syn on

exe ":colo mdk"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
