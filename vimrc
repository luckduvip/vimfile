"show the lines number
set nu
set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
Plug 'wincent/command-t'
Plug 'Shougo/vimshell'
Plug 'scrooloose/nerdcommenter'  "快速注释代码
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/grep.vim'
Plug 'honza/vim-snippets'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Raimondi/delimitMate'  "{()}补全
Plug 'posva/vim-vue'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'brooth/far.vim'
Plug 'heavenshell/vim-jsdoc'
call plug#end()

set cursorline
set cursorcolumn
syntax on
filetype on
filetype plugin on
filetype indent on
set cindent
"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4
set list
set listchars=tab:\|-
if has("gui_macvim")
	set fu 
endif 
syntax enable
set background=dark
colorscheme VisualStudioDark
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set history=100
set nobackup
set noswapfile

set autoread "auto read the file which is changed
set incsearch


let mapleader=","
let maplocalleader="."
nnoremap wn <c-w>n
nnoremap wc <c-w>c
nnoremap wf <c-w>f
nnoremap wv <c-w>v
nnoremap wh <c-w>h
nnoremap wj <c-w>j
nnoremap wk <c-w>k
nnoremap wl <c-w>l
nnoremap w= <c-w>=
nnoremap <localleader>cd :cd %:p:h<cr>
nnoremap <localleader>sh :VimShell<cr>
nnoremap <localleader>gr  :Grep<cr>
nnoremap <c-p> :CommandT .<cr>
nnoremap <localleader>tf :CommandTFlush<cr>

"snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<D-j>"
let g:UltiSnipsJumpForwardTrigger="<D-j>"
let g:UltiSnipsJumpBackwardTrigger="<D-k>"

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"map grep
nnoremap <localleader>g :Grep<cr>
"about nerdtree
nnoremap <localleader>nt :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
au BufRead,BufNewFile *.scss set filetype=scss.css

"statusline                                                                                                                                  
set statusline=  
set statusline+=%7*\[%n]                                  "buffernr  
set statusline+=%1*\ %<%F\                                "文件路径  
set statusline+=%2*\ %y\                                  "文件类型  
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1  
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "编码2  
set statusline+=%4*\ %{&ff}\                              "文件系统(dos/unix..)   
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?  
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)  
set statusline+=%9*\ col:%03c\                            "光标所在列  
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom  
function! HighlightSearch()  
	if &hls  
		return 'H'  
	else  
		return ''  
	endif  
endfunction  
hi User1 ctermfg=white  ctermbg=darkred  
hi User2 ctermfg=blue  ctermbg=58  
hi User3 ctermfg=white  ctermbg=100  
hi User4 ctermfg=darkred  ctermbg=95  
hi User5 ctermfg=darkred  ctermbg=77  
hi User7 ctermfg=darkred  ctermbg=blue  cterm=bold  
hi User8 ctermfg=231  ctermbg=blue  
"hi User9 ctermfg=#ffffff  ctermbg=#810085  
hi User0 ctermfg=yellow  ctermbg=138  

"CommandT 不能正解的关闭在ternimal的情况下
if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif


"nerd commenter
" Add spaces after comment delimiters by default
"gitgutter
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = 'mm'
let g:gitgutter_sign_removed = '-~'
let g:gitgutter_sign_removed_first_line = '--'
let g:gitgutter_sign_modified_removed = '-w'

let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

nnoremap <localleader>ycmr :YcmCompleter RestartServer<cr>


" 鼠标停留在方法内时显示参数提示
let g:tern_show_argument_hints = 'on_hold'
" 补全时显示函数类型定义
let g:tern_show_signature_in_pum = 1
" 跳转到浏览器
nnoremap <leader>tb :TernDocBrowse<cr>
" 显示变量定义
nnoremap <leader>tt :TernType<cr>
" 跳转到定义处
nnoremap <leader>tf :TernDef<cr>
" 显示文档
nnoremap <leader>td :TernDoc<cr>
" 预览窗口显示定义处代码
nnoremap <leader>tp :TernDefPreview<cr>
" 变量重命名
nnoremap <leader>tr :TernRename<cr>
" location 列表显示全部引用行
nnoremap <leader>ts :TernRefs<cr>

" js doc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_allow_shorthand = 1
let g:jsdoc_enable_es6 = 1
nnoremap <localleader>jd :JsDoc<cr>
nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)
