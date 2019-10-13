" =============================================================================
" WU Jiaze .vimrc file
" -----------------------------------------------------------------------------
" heavily inspired by: @millermedeiros
" =============================================================================

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" {{{---------------------------------- Autocommand ------------------------------------
" Set file without extension as sh
" autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | endif
" autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set ft=sh | endif
" autocmd BufRead,BufNewFile * if expand('<afile>:e') == '' | set ft=sh | end

augroup cxxfiletype
    " Remove all autocommands for current group
    au!
    au BufNewFile,BufRead *.hxx set filetype=cpp
    au BufNewFile,BufRead *.cxx set filetype=cpp
    " au BufNewFile,BufRead *.cpp set filetype=cpp
augroup END

augroup kdbfiletype
    " Remove all autocommands for current group
    au!
    au BufNewFile,BufRead *.k set filetype=k
    au BufNewFile,BufRead *.q set filetype=q
    au BufNewFile,BufRead *.s set filetype=sql
augroup END
" }}}


" {{{---------------------------------- Vundle ------------------------------------
" Plugin manager - Vundle
filetype on                 " filetype must be 'on' before setting it 'off'
                            " otherwise it exits with a bad status and breaks git commit.
filetype off                " force reloading *after* pathogen loaded

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'dkprice/vim-easygrep'
Plugin 'easymotion/vim-easymotion'

Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'vim-syntastic/syntastic'
" Plugin 'ycm-core/YouCompleteMe'

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
" }}}


" {{{---------------------------------- Common Plugin ------------------------------------
" rtp= replace, rtp+= append, rtp^= insert before

" Window management
" set rtp^=~/tools/vimplugin/nerdtree
" set rtp^=~/tools/vimplugin/tagbar
" set rtp^=~/tools/vimplugin/vim-airline

" " File and directory management
" set rtp^=~/tools/vimplugin/a.vim
" set rtp^=~/tools/vimplugin/vim-fswitch

" " File and directory search
" set rtp^=~/tools/vimplugin/fzf
" set rtp^=~/tools/vimplugin/fzf.vim
" set rtp^=~/tools/vimplugin/ctrlp.vim

" " Text search and navigation
" set rtp^=~/tools/vimplugin/vim-easygrep
" set rtp^=~/tools/vimplugin/vim-easymotion

" " Text edit
" set rtp^=~/tools/vimplugin/vim-autoformat
" set rtp^=~/tools/vimplugin/nerdcommenter
" set rtp^=~/tools/vimplugin/vim-multiple-cursors
" set rtp^=~/tools/vimplugin/vim-easy-align
" set rtp^=~/tools/vimplugin/vim-surround

" " Highlight for syntax text changes
" " Only work in Vundle !!!
" " set rtp^=~/tools/vimplugin/vim-cpp-enhanced-highlight 
" " set rtp^=~/tools/vimplugin/vim-cpp-modern
" set rtp^=~/tools/vimplugin/vim-qkdb-syntax
" set rtp^=~/tools/vimplugin/vim-signify

" set rtp^=~/tools/vimplugin/syntastic
" " set rtp^=~/tools/vimplugin/YouCompleteMe
" " set rtp^=~/tools/vimplugin/ale

" " Source version control in vim
" " set rtp^=~/tools/vimplugin/vc.vim 

" set rtp^=~/tools/vimplugin/asyncrun.vim
" " set rtp^=~/tools/vimplugin/Conque-GDB
" " }}}


" {{{---------------------------------- Common Setting ------------------------------------
" --- history / file handling --- 
set history=200         " keep 200 lines of command line history
" set undolevels=999    " Moar undo (default=100)
" set autoread          " reload files if changed externally

" --- backup and swap files ---
" Save all the time, those are annoying and unnecessary...
" set nobackup
" set nowritebackup
" set noswapfile

" --- performance / buffer --- 
" set hidden                  " can put buffer to the background without writing
"                             "   to disk, will remember history/marks.
" set lazyredraw              " don't update the display while executing macros
" set ttyfast                 " Send more characters at a given time.

" --- search / regexp ---
" set gdefault                " RegExp global by default
" set magic                   " Enable extended regexes.
set hlsearch                " highlight searches
" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif
" set ignorecase smartcase    " make searches case-insensitive, unless they
"                             "   contain upper-case letter

" Highlight paired brackets: {([<
set matchpairs+=<:>

" --- keys ---
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
" set esckeys                     " Allow cursor keys in insert mode.
" set nostartofline               " Make j/k respect the columns
" set virtualedit=all            " allow the cursor to go in to 'invalid' places
" set timeoutlen=500              " how long it wait for mapped commands
" set ttimeout                  " time out for key codes (should be mapped keys)
" set ttimeoutlen=100           " wait up to 100ms after Esc for special key
" set ttimeoutlen=100             " faster timeout for escape key and others

" Show @@@ in the last line if it is truncated.
set display=truncate

" Color scheme
colo desert

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
    "set mouse=a
    set mouse=n
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup END

endif " has("autocmd")
" filetype plugin indent on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" size of an "indent"
set shiftwidth=4
" automatically inserts one extra level of indentation in some cases
set smartindent
"set cindent

" --- Space & Tab ---
" size of a hard tabstop
set tabstop=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab
" Show tab character
"set lcs=tab:->,trail:?eol:?nbsp:_
set listchars=tab:->
set list

" Movements
" move to beginning/end of line
" nnoremap B ^
" nnoremap E $
" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]

" --- UI Config ---
set cursorline      " Highlight current line
set number          " Enable line number
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set wildmenu        " display completion matches in a status line
set showmatch       " highlight matching [{()}]
set laststatus=2
set statusline=%F\ [%l,%c]\ [%p%%] 

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
" set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" Paste from another application, enable/disable by F2
"set pastetoggle=<F2>

" Color
colo desert
"colo torte

" Folding
set foldmethod=marker
autocmd FileType vim,c++,txt setlocal foldmethod=marker
nnoremap <space> za

syntax on
filetype plugin indent on   " enable detection, plugins and indent

" Must be after syntax
highlight Comment ctermfg=LightBlue
" }}}


" {{{------------------------------- Key Mapping -------------------------------
let mapleader = ","

" Tab switch
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
" Buffer switch
nnoremap <ESC>h :bp<CR>
nnoremap <ESC>l :bn<CR>
" save session
" nnoremap <leader>s :mksession<CR>

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
" map Q gq
" }}}


" {{{ ------------------------------- nerdtree -------------------------------
nnoremap <C-d>  :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.swp','\.swo','\.zip','\.pyc$','\.obj','\.exe']
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" }}}


" {{{ ------------------------------- tagbar -------------------------------
" let g:tagbar_right = 1
" let g:tagbar_vertical = 25
" let g:tagbar_horizontal = 10
nnoremap <leader>to : TagbarToggle <CR>
" }}}


" {{{ ------------------------------- a.vim -------------------------------
" nnoremap <C-o> :A<CR>
nnoremap <ESC>o :A<CR><ESC>
" let g:alternateExtensions_cxx = "hxx"
" let g:alternateExtensions_hxx = "cxx"
" let g:alternateExtensions_cpp = "hpp"
" let g:alternateExtensions_hpp = "cpp"
" }}}


" {{{ ------------------------------- fswitch.vim -------------------------------
" Switch to the file and load it into the current window >
nnoremap <silent> <Leader>of :FSHere<cr>
" Switch to the file and load it into the window on the right >
nnoremap <silent> <Leader>ol :FSRight<cr>
" Switch to the file and load it into a new window split on the right >
nnoremap <silent> <Leader>oL :FSSplitRight<cr>
" Switch to the file and load it into the window on the left >
nnoremap <silent> <Leader>oh :FSLeft<cr>
" Switch to the file and load it into a new window split on the left >
nnoremap <silent> <Leader>oH :FSSplitLeft<cr>
" Switch to the file and load it into the window above >
nnoremap <silent> <Leader>ok :FSAbove<cr>
" Switch to the file and load it into a new window split above >
nnoremap <silent> <Leader>oK :FSSplitAbove<cr>
" Switch to the file and load it into the window below >
nnoremap <silent> <Leader>oj :FSBelow<cr>
" Switch to the file and load it into a new window split below >
nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>
" }}}


" {{{ ------------------------------- vim-airline -------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}


" {{{ ------------------------------- fzf && fzf.vim -------------------------------
" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'up': '~40%' }

nnoremap <leader>zf :Files<CR>
nnoremap <leader>zb :Buffers<CR>
nnoremap <leader>zc :Colors<CR>
nnoremap <leader>zt :Tags<CR>
nnoremap <leader>zm :Commands<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" }}}


" {{{ ------------------------------- ctrlp.vim -------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" 'c' - the directory of the current file.
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'w' - begin finding a root from the current working directory outside of CtrlP
"       instead of from the directory of the current file (default). Only applies when "r" is also present.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'arw'

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore:
set wildignore+=*/tmp/*,*/build/*,*.so,*.swp,*.swo,*.zip,*.pyc     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }}}


" {{{------------------------------- vim-easymotion -------------------------------
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
nmap m <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}


" {{{------------------------------- vim-autoformat -------------------------------
noremap <F3> :Autoformat<CR>
let g:formatdef_my_custom_cpp = '"astyle --style=bsd --attach-inlines --attach-extern-c --indent-classes --indent-switches --indent-preproc-define --indent-col1-comments --pad-oper --pad-comma --align-pointer=type --align-reference=type --add-brackets --convert-tabs --suffix=none"'
let g:formatters_cpp = ['my_custom_cpp']
" }}}


" {{{------------------------------- nerdcommenter -------------------------------
" convenient comment plugin
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" }}}


" {{{------------------------------- vim-easy-align -------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" let g:easy_align_ignore_groups = ['Comment', 'String']

if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
" let  g:easy_align_delimiters['#'] = { 'pattern': '#'        , 'ignore_groups': ['String'] }
let  g:easy_align_delimiters[','] = { 'pattern': ','        , 'left_margin': 0, 'right_margin': 1, 'stick_to_left': 0 }
let  g:easy_align_delimiters[' '] = { 'pattern': ' '        , 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 }
let  g:easy_align_delimiters['>'] = { 'pattern': '>>\|=>\|>', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
let  g:easy_align_delimiters['<'] = { 'pattern': '<<\|<=\|<', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
let  g:easy_align_delimiters[']'] = { 'pattern': '[[\]]'    , 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 }
let  g:easy_align_delimiters[')'] = { 'pattern': '[()]'     , 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
"}}}


" {{{------------------------------- vim-easyclip -------------------------------
" let g:EasyClipUseSubstituteDefaults = 1
" let g:EasyClipUseYankDefaults = 0
" let g:EasyClipUseCutDefaults = 0
" }}}


" {{{------------------------------- vim-cpp-enhanced-highlight -------------------------------
let g:cpp_concepts_highlight = 1
" }}}


" {{{------------------------------- vim-cpp-modern -------------------------------
" }}}


" {{{------------------------------- vim-signify -------------------------------
let g:signify_vcs_list              = [ 'git', 'hg', 'svn' ]
" let g:signify_cursorhold_insert     = 1
" let g:signify_cursorhold_normal     = 1
" let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 1

nnoremap <leader>st :SignifyToggle<CR>
nnoremap <leader>sh :SignifyToggleHighlight<CR>
nnoremap <leader>sr :SignifyRefresh<CR>
nnoremap <leader>sd :SignifyDebug<CR>

" hunk jumping
nmap <leader>sj <plug>(signify-next-hunk)
nmap <leader>sk <plug>(signify-prev-hunk)
" }}}


" {{{------------------------------- YouCompleteMe -------------------------------
" let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_use_clangd = 0
" let g:ycm_filetype_whitelist = {'cpp': 1, 'python': 1}
" let g:ycm_filetype_blacklist = {'sh': 1}

" YCM code debug
" Force YCM to immediately recompile your file and display any new diagnostics
nnoremap <leader>yr :YcmRestartServer<CR>
nnoremap <leader>ys :YcmShowDetailedDiagnostic<CR>
nnoremap <leader>yd :YcmDebugInfo<CR>
nnoremap <leader>yt :YcmToggleLogs<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" Show a detailed diagnostic message with the key mapping
" when your cursor is on the line with the diagnostic.
"  <leader>d

" YCM code navigation
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gm :YcmCompleter GoToImprecise<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gf :YcmCompleter FixIt<CR>
" Use CTRL-O to jump back to where you where before invoking the command 
" Use CTRL-I to jump forward; see :h jumplist 
" }}}


" {{{------------------------------- syntastic -------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" }}}


" {{{------------------------------- asyncrun -------------------------------
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" }}}

