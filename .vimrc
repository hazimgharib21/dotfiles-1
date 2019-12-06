set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-sensible'
Plugin 'djoshea/vim-autoread'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'szw/vim-ctrlspace'
"Plugin 'taketwo/vim-ros'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'scrooloose/syntastic'
"Plugin 'justmao945/vim-clang'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'erisian/rest_tools'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'universal-ctags/ctags'
Plugin 'junegunn/goyo.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Switch to a color scheme for dark background
set background=dark

" Fix diff color scheme
highlight DiffText term=reverse cterm=bold ctermbg=124 gui=bold guibg=Red3

" Change auto-complete color scheme
highlight Pmenu ctermbg=brown ctermfg=black
highlight PmenuSel ctermbg=green

" Prevent auto-indenting of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Let Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Open each buffer in its own tabpage
"au BufAdd,BufNewFile * nested tab sball

" Some tuning
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set mouse=a			" Enable mouse usage (all modes)
set ruler
set number
set splitbelow
set splitright
set hidden
" Tabs settings
set expandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2
" Make tab completion in command mode behave like in Bash
set wildmenu
set wildmode=longest,list
set wildignore=*.o,*.class,*.swp,*.swo,*.pyc

" Use tree view for netrw directory browsing
let g:netrw_liststyle=3
let g:netrw_banner=0

" CtrlSpace config
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|build|dist|env|node_modules|platforms|plugins|www\/lib)[\/]'

" ROS config
let g:ros_make = "current"
let g:ros_build_system = "catkin"
"let g:ros_catkin_make_options = "-DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

" AutoFormat config
let g:autoformat_verbosemode = 1
"! astyle version 2.05 or higher is required
let g:formatdef_astyle_cpp = '"astyle --mode=c --style=allman --indent=spaces=2 --pad-oper --unpad-paren --pad-header --convert-tabs"'
let g:formatters_cpp = ['astyle_cpp']
"! sudo apt-get install python-autopep8
let g:formatdef_autopep8 = '"autopep8 - -aa --max-line-length=199 --ignore=E128,E722"'
let g:formatters_python = ['autopep8']
"! sudo npm install -g js-beautify
" Formatter for js, json, html and css.
let g:formatdef_jsbeautify_js = '"js-beautify -f - --jslint-happy -s 2 -n"'
let g:formatters_javascript = ['jsbeautify_js']
let g:formatters_json = ['jsbeautify_js']

" Indentation config for html and htmldjango
let g:html_indent_inctags = 'body,head,tbody,p'

" YouCompleteMe config
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-n>']		" Disable <Down> and <TAB> key
let g:ycm_key_list_previous_completion = ['<C-p>']	" Disable <Up> and <S-TAB> key

" Associates triggers with ROS filetypes
let g:ycm_semantic_triggers = {
\   'roslaunch': ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction': ['re!^'],
\ }

" Import mswin key mappings and behavior.
source $VIMRUNTIME/mswin.vim

" Leader mapping
let mapleader = ","


" toggle goyo
nmap <leader>g :Goyo<cr>

" autoformat
nmap <leader>f :Autoformat<cr>


" clear highlighting when searching
nmap <silent> ,/ :nohlsearch<cr>

" Windows navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Unmap CTRL-Y(redo) to its original scroll
nunmap <C-Y>
iunmap <C-Y>

" Insert mode shortcuts
inoremap II		<Esc>I
inoremap AA		<Esc>A
inoremap OO		<Esc>O

" Move by virtual lines when used without a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" Avoid pressing shift key to switch to previous tab
noremap gr gT

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" Allows you to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the mapping
" below pre-fills the current word for you to change.
nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

" Allow you to easily search the current word.
nnoremap <Leader>ff /\<<C-r><C-w>\><CR>
vnoremap <Leader>ff y/<C-r>"<CR>

" Diff shortcuts
noremap <leader>df :call DiffToggle()<CR>
function! DiffToggle()
  if &diff
    diffoff!
    windo setlocal nocursorbind
  else
    windo diffthis
  endif
:endfunction

" Smooth Scroll shortcuts
noremap <silent> <c-y> :call smooth_scroll#up(3, 0, 3)<CR>
noremap <silent> <c-e> :call smooth_scroll#down(3, 0, 3)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

" ROS shortcuts
noremap <F10> :make!<CR>

" AutoFormat shortcuts
"noremap <F3> :Autoformat<CR><CR>
noremap <leader>af :Autoformat<CR>

" Remove trailing whitespaces
noremap <leader>as :%s/\s\+$//e<CR>

" Fugitive shortcuts
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" YouCompleteMe shortcuts
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gr :YcmForceCompileAndDiagnostics<CR>

" Hard mode - disable arrow keys
map <Up>	 :echo "no!"<cr>
map <Down>	 :echo "no!"<cr>
map <Left>	 :echo "no!"<cr>
map <Right>	 :echo "no!"<cr>
inoremap <Up>		<NOP>
inoremap <Down>		<NOP>
inoremap <Left>		<NOP>
inoremap <Right>	<NOP>

" Disable Execute Mode
nmap Q	<NOP>

" Goyo config
let g:goyo_linenr=1

" center the scroll line
" may jump if scroll line at bottom or top
nnoremap j jzz
nnoremap k kzz

