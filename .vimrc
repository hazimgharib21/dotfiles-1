set nocompatible              " be iMproved, required
filetype off                  " required

" ***************************************** Vundle Start ************************************
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'preservim/tagbar'

Plugin 'Chiel92/vim-autoformat'
"Plugin 'tpope/vim-sensible'
"Plugin 'djoshea/vim-autoread'
"Plugin 'terryma/vim-smooth-scroll'
"Plugin 'szw/vim-ctrlspace'
"Plugin 'taketwo/vim-ros'
"Plugin 'scrooloose/syntastic'
"Plugin 'justmao945/vim-clang'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'ervandew/supertab'
"Plugin 'SirVer/ultisnips'
"Plugin 'erisian/rest_tools'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'rodjek/vim-puppet'
"Plugin 'tpope/vim-fugitive'
"Plugin 'ludovicchabant/vim-lawrencium'
"Plugin 'universal-ctags/ctags'
"Plugin 'junegunn/goyo.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ***************************************** Vundle End ************************************


" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

set path+=**

" Fast saving
nmap <leader>w :w!<cr>

" Display all matching files when tab complete
set wildmenu

" Always show current position
set ruler

" Height of command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace to act as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" incremental search
set incsearch

" Don't redraw while executing macros
set lazyredraw

" Show matching brackets
set showmatch

" no annoying sound errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

try
  colorscheme desert
catch
endtry

" Fix diff color scheme
highlight DiffText term=reverse cterm=bold ctermbg=124 gui=bold guibg=Red3

" Change auto-complete color scheme
highlight Pmenu ctermbg=brown ctermfg=black
highlight PmenuSel ctermbg=green

" Switch to a color scheme for dark background
set background=dark

" set utf8 as standard encoding
set encoding=utf-8

" turn of backup
set nobackup
set nowb
set noswapfile

" use space instead of tabs
set expandtab

" be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" linebreak on 500 character
set lbr
set tw=500

" set auto indent, smart indent and wrap lines
set ai
set si
set wrap

" always show the status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" search current selection using * and #
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Let Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 0 will move curser to first non-blank character
map 0 ^

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.sh :call CleanExtraSpaces()
endif

" clear highlighting when searching
map <silent> <leader>/ :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Prevent auto-indenting of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**

" Enable mouse usage
set mouse=a
set number
set splitbelow
set splitright

set cursorline
hi CursorLine cterm=NONE ctermbg=8 ctermfg=None guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Make tab completion in command mode behave like in Bash
set wildmode=longest,list
set wildignore=*.o,*.class,*.swp,*.swo,*.pyc

" Use tree view for netrw directory browsing
let g:netrw_banner=0
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1         " open splits to the right
let g:netrw_liststyle=3    " tree view

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

" Associates triggers with ROS filetype5
let g:ycm_semantic_triggers = {
\   'roslaunch': ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction': ['re!^'],
\ }

" Import mswin key mappings and behavior.
source $VIMRUNTIME/mswin.vim

" autoformat
nmap <leader>f :Autoformat<cr>

" Windows navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Unmap CTRL-Y(redo) to its original scroll
nunmap <C-Y>
iunmap <C-Y>

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
nnoremap <>rc :%s/\<<C-r><C-w>\>/
vnoremap <>rc y:%s/<C-r>"/

" Allows you to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the mapping
" below pre-fills the current word for you to change.
nnoremap <>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <>cc y:%s/<C-r>"/<C-r>"

" Allow you to easily search the current word.
nnoremap <>ff /\<<C-r><C-w>\><CR>
vnoremap <>ff y/<C-r>"<CR>

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

noremap <Left> :vertical resize +1<CR>
noremap <Right> :vertical resize -1<CR>
noremap <Up> :resize +1<CR>
noremap <Down> :resize -1<CR>

" Disable Execute Mode
nmap Q	<NOP>

" center the scroll line
" may jump if scroll line at bottom or top
nnoremap j jzz
nnoremap k kzz

nmap T :TagbarToggle<CR>
let g:tagbar_width = 20
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Helper Function

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

