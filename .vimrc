set textwidth=160
set wrap
" 关闭兼容
set nocompatible
" 关闭响铃
set belloff=all
" 显示行数
set number
" 加速滚动
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttyscroll=3                 " Speedup scrolling
" 不要备份文件 .swap
set nobackup
set noswapfile
" 终端下 256色
set t_Co=256
" 打开文件检测
filetype indent on
" 高亮光标所在行数
set cursorline
" 高亮 搜索词
set hlsearch
" 自动缩排
set autoindent
" /搜索
set incsearch
" 不要错误响铃
set noerrorbells
" 支持鼠标
set mouse=a
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
" 设置主题 sierra
let g:solarized_termcolors=256
"let g:sierra_Sunset = 1
let g:airline_theme='silver'
colorscheme loogica
" 设置字符集
set encoding=utf-8
" 代码折叠相关
set foldmethod=syntax           " 使用语法分析作为折叠方式
set foldlevelstart=99           " 关闭默认折叠
set foldcolumn=1                " 设置折叠信息+
nmap <c-a> zM
nmap <c-s> zR
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
" 设置映射
let mapleader = ","
" vim plugin
call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

let g:go_version_warning = 0

" set NERDTree for vim dir plugin "
autocmd VimEnter * NERDTree
"close vim when only nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:go_fmt_command = "goimports"
nmap <C-n> :NERDTreeToggle<CR>

"set nocursorcolumn              " Do not highlight column (speeds up highlighting)
"set nocursorline                " Do not highlight cursor (speeds up highlighting)
"change tab to space


autocmd BufEnter * silent! lcd %:p:h
set lazyredraw                  " Wait to redraw
"git for nerdtree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "Modified",
    \ "Staged"    : "Staged",
    \ "Untracked" : "Untracked",
    \ "Renamed"   : "Renamed",
    \ "Unmerged"  : "Unmerged",
    \ "Deleted"   : "Deleted",
    \ "Dirty"     : "Changed",
    \ "Clean"     : "Clean",
    \ 'Ignored'   : 'Ignored',
    \ "Unknown"   : "?"
    \ }

"see the tail space with color red"
highlight ExtraWhitespace ctermbg=red
let g:show_spaces_that_precede_tabs=1

" vim-go  auto complete!!!

" use gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_disable_autoinstall = 1

au filetype go inoremap <buffer> . .<C-x><C-o>
"tarbar
nmap <S-t> :TagbarToggle<CR>
"auto open tagbar
"autocmd BufReadPost *.py,*.cpp,*.go call tagbar#autoopen()
set updatetime=100


" go hightlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
"close this otherwise vim is slow ref >> fatih/vim-go wiki
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
" go check
"let g:go_metalinter_enabled = ['vet', 'golint']
"let g:go_metalinter_autosave = 1
" open file style
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"ctrp
let g:ctrlp_map = '<space>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"nerd commenter
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

"identline char
let g:indentLine_char = '⦙'

"quick move
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" in case the del
set backspace=indent,eol,start



" 设置自动补全的模式
set completeopt=menu,noinsert,noselect,preview

"my owner function
"my quick comment and uncomment
function Comment()
	exe 's/' . '^' . '/' . '\/\/' . '/g'
endfunction

function Uncomment()
	exe 's/' . '\/\/' . '/'  '/g'
endfunction

cmap <c-c> call Comment()<CR>
cmap <c-x> call Uncomment()<CR>


"my quick remove space
function AutoRemoveSpace()
	%s/\s\+$//e
endfunction

nmap <S-c> :call AutoRemoveSpace()<CR>
