if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,gbk,gb2312,gb18030,big5,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
" endif

" if &term=="xterm"
"      set t_Co=8
"      set t_Sb=[4%dm
"      set t_Sf=[3%dm
" endif


" if &term=="vt100"
"      set t_Co=8
"      set t_Sb=[4%dm
"      set t_Sf=[3%dm
" endif

"filetype on
filetype plugin indent on 
syntax on
syntax enable
set showmatch
set showmode
set autoindent
set smartindent
set nu
set tabstop=4
set expandtab
set shiftwidth=4
set incsearch
set hlsearch
set hidden
set laststatus=2
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set scrolloff=5
set listchars=tab:>-,trail:^
set list
"set textwidth=110
let g:pydiction_location = '/root/.vim/after/ftplugin/pydiction/complete-dict'
highlight WhitespaceEOL ctermbg=red guibg=red
highlight PMenu ctermfg=0 ctermbg=001 guifg=green guibg=darkgrey
" highlight PMenuSel ctermfg=242 ctermbg=8 guifg=white guibg=red
match WhitespaceEOL /\s\+$/

" tab
:map  <F2> :tabprevious<CR>
:map  <F3> :tabnext<CR>
:map  <F4> :tabnew .<CR>
:map  <C-O> :tabnew .<CR>i
:imap  <F2> <ESC>:tabprevious<CR>i
:imap  <F3> <ESC>:tabnext<CR>i
:imap  <F4> <ESC>:tabnew .<CR>i
:imap  <C-O> <ESC>:tabnew .<CR>i

" Buffer Explorer
let g:bufExplorerDefaultHelp=0       " Do not show default help. 
"let g:bufExplorerShowRelativePath=1  " Show relative paths. 
"let g:bufExplorerSortBy='mru'        " Sort by most recently used. 
"let g:bufExplorerSplitRight=0        " Split left. 
let g:bufExplorerSplitVertical=1     " Split vertically. 
let g:bufExplorerSplitVertSize = 30  " Split width 
let g:bufExplorerUseCurrentWindow=1  " Open in new window. 
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"miniBufExplorer
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1 

" Tag list
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=1

"WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:persistentBehaviour=0
nmap wm :WMToggle<cr>
:map <s-w><s-t> :WMToggle<cr>
nmap <C-W><C-K> :FirstExplorerWindow<cr>
nmap <C-W><C-j> :BottomExplorerWindow<cr>

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'jacoborus/tender.vim'
" colorscheme tender
Plug 'rakr/vim-one'
" colorscheme one
Plug 'drewtempelmeyer/palenight.vim'
" colorscheme palenight
Plug 'KeitaNakamura/neodark.vim'
" colorscheme neodark
Plug 'iCyMind/NeoSolarized'
" colorscheme NeoSolarized
Plug 'crusoexia/vim-monokai'
" colorscheme monokai
Plug 'morhetz/gruvbox'
" colorscheme gruvbox

Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/LeaderF'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/echodoc.vim'


" Initialize plugin system
call plug#end()


" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
autocmd Filetype python,c,cpp,Java,vim nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_python_binary_path = 'python'
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_max_num_candidates = 30
let g:ycm_complete_in_strings=1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "python": 1,
            \ "Java": 1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ "vim":1,
            \ }


" LeaderF
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
" let g:Lf_CommandMap = {'<C-T>': ['<F4>']}
let g:Lf_CommandMap = {'<C-T>': ['<CR>']}
let g:Lf_WindowPosition  = 'right'
:map  <F1> :Leaderf function<CR>

" syntax enable
" set termguicolors
" colorscheme gruvbox
" colorscheme tender


" ctags
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" NERDTree
" autocmd vimenter * NERDTree
map <leader>t :NERDTreeToggle<CR>


set switchbuf=usetab,newtab
