" Copyright: Mareana
" File              : init.vim
" Author            : Dinesh Jinjala <dinesh.jinjala@mareana.com>
" Date              : 30/04/2023 12:03:46
" Last Modified Date: 11/01/2024 14:53:54
" Last Modified By  : Dinesh Jinjala <dinesh.jinjala@mareana.com>
" Video to take help https://www.youtube.com/watch?v=JWReY93Vl6g
:set number
:set relativenumber 
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set noswapfile
:set mouse=a
:set cmdheight=2
:set encoding=utf8
:set termguicolors
:set autoread
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 

" :set clipboard=unnamedplus
"

set laststatus=2

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
" Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
" Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/vim-scripts/indentpython.vim'
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/bps/vim-textobj-python'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
" Plug 'https://github.com/mbbill/undotree'
Plug 'https://github.com/alpertuna/vim-header'
" Plug 'https://github.com/tell-k/vim-autopep8'
Plug 'https://github.com/heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/wellle/targets.vim' " To install ci( ca( di( etc.
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'djoshea/vim-autoread'
" Plug 'glepnir/dashboard-nvim'
" icons for neovim
Plug 'kyazdani42/nvim-web-devicons'
" Top tab bar
" Plug 'romgrk/barbar.nvim'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/doom-one.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" If you have nodejs
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
set encoding=UTF-8
call plug#end()


" This is for the vim-devicons. For windows it is not working.
" set guifont=DroidSansMono\ Nerd\ Font:h11
" set guifont=OperatorMono-Bold:h13
"

lua require('plugins')
" :lua require("telescope").extensions.live_grep_raw.live_grep_raw()

let g:indentLine_fileTypeExclude = ['dashboard']
let g:dashboard_default_executive = 'fzf'

let python_highlight_all=1
filetype plugin on
syntax on
set syntax=on

" Git Gutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap [g  :GitGutter<CR>
nmap [hs <Plug>(GitGutterStageHunk)
nmap [hu <Plug>(GitGutterUndoHunk)
nmap [hp <Plug>(GitGutterPreviewHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0


nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Apply AutoFix to problem on the current line.
nmap <C-q>  <Plug>(coc-fix-current)
nmap <C-t> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

" :colorscheme jellybeans
" :colorscheme tokyonight
" :colorscheme default
" :colorscheme onehalfdark
" :colorscheme minimalist
" :colorscheme embark 
" :colorscheme doom-one
" let g:doom_one_terminal_colors = v:true
:colorscheme catppuccin-mocha
" :colorscheme onedark_dark
let g:airline_theme = 'catppuccin'

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" " Vim
" let g:indentLine_color_term = 202

" " GVim
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'

" Custom key map
let mapleader = " "
nnoremap <leader>h :wincmd h<CR> " window command
nnoremap <leader>j :wincmd j<CR> " window command
nnoremap <leader>k :wincmd k<CR> " window command
nnoremap <leader>l :wincmd l<CR> " window command
nnoremap <leader>r :e!<CR> " window command
" nnoremap <leader>nu :UndotreeShow<CR> " normal command
" nnoremap <leader>nn :NERDTree<CR> " normal command
nnoremap <leader>nn :Neotree<CR> " normal command
nnoremap <leader>nb :Neotree buffers<CR> " normal command
nnoremap <leader>ng :GrammarousCheck<CR> " normal command
nnoremap <leader>nf :set foldmethod=manual<CR> " normal command
" nnoremap <leader>s :SyntasticCheck<CR>
" nnoremap <leader>z :Prettier<CR>
nnoremap <leader>nu :Autopep8<CR> " normal command
autocmd FileType python3 noremap <buffer> <F8> :call Autopep8()<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR> " quit 
nnoremap <leader>q :q!<CR> " don't save and quit
nnoremap <leader>wq :wq<CR>

nmap <leader>na  :AddHeader<CR> " normal command
" nmap <leader>p "+p
" nmap <leader>P "+P
" vmap <leader>y "+y
" paste from system clipboard, align indentation with surroundings
noremap <Leader>p "*]p:set nopaste<CR>
noremap <Leader>P "*]P:set nopaste<CR>
" copy a sentence into system clipboard
noremap <Leader>y "+y)
vmap <leader>/ gc
nmap <leader>/ gc_
nmap <leader>d oimport pdb;pdb.set_trace()<esc>
nmap <leader>np :Pydocstring<CR>

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
"
" " Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Enable folding
" set foldmethod=indent
set foldlevel=99
set foldmethod=manual

autocmd InsertLeave,WinEnter * setlocal foldmethod=manual
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual

let g:header_field_author = 'Dinesh Jinjala'
let g:header_field_author_email = 'dinesh.jinjala@mareana.com'
let g:header_field_timestamp_format = '%d/%m/%Y %H:%M:%S'
let g:header_auto_add_header = 1
let g:header_max_size = 9
let g:header_alignment = 1
let g:header_field_modified_timestamp = 1
let g:header_field_copyright = 'Copyright: Mareana'

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" " let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_quiet_messages = { "type": "style" }

" let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_matlab_mlint_exec = 'mlint'
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["python", "matlab", "ruby", "php"],
        \ "passive_filetypes": [] }

let g:pydocstring_doq_path = '/Users/dineshjinjala/.config/coc/extensions/coc-pydocstring-data/doq/venv/bin/doq'
let g:pydocstring_formatter = 'google'
let g:pydocstring_ignore_init = 1

" Move to previous/next
nnoremap  <leader>zb :Buffers<CR>
nnoremap  <leader>zp :BufferPrevious<CR>
nnoremap  <leader>zn :BufferNext<CR>
nnoremap  <leader>zc :BufferClose<CR>

nnoremap gp :silent %!prettier --stdin-filepath %<CR>
" CTRL-W + | Set current window width to N (default: widest possible).
" CTRL-W + _ Set current window height to N (default: highest possible).
" CTRL-W + = Make all windows (almost) equally high and wide.
" nnoremap <leader>sz <C-w>| " window command
nnoremap <leader>wa <C-w>_ " window command
nnoremap <leader>wo <C-w>= " window command 
nnoremap <leader>wz :vertical resize<CR>:resize<CR> " window command 
nnoremap <leader>wv :vsplit<CR> " window command 
nnoremap <leader>wh :split<CR> " window command 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

augroup vimrc_todo
au!

au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|INFO):/
	  \ containedin=.*Comment,vimCommentTitle
augroup END

" TODO: startify session
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
\ { 'type': 'files',     'header': ['   Files']            },
\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
\ { 'type': 'sessions',  'header': ['   Sessions']       },
\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
\ ]
let g:startify_bookmarks = [
\ { 'c': '~/.tmux.conf' },
\ { 'i': '~/.config/nvim/init.vim' },
\ { 'z': '~/.zshrc' },
\ '~/AllCode/mdh_cpv_services/services/',
\ '~/Documents/AllCode/authentication/',
\ '~/Documents/AllCode/airflow/',
\ '~/Documents/AllCode/mdhpythonmicro/mdhpythonmicro/',
\ '~/Documents/AllCode/mdh_pbr_services/',
\ '~/Documents/AllCode/midatabase/'
\ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

" hi TabLineSel ctermfg=red ctermbg=black

:resize

" Re-order to previous/next
" nnoremap <silent>   <leader><z> :BufferMovePrevious<CR>
" nnoremap <silent>    <z->> :BufferMoveNext<CR>

" This is for barbar:
" Move to previous/next
" nnoremap <leader>bp :BufferPrevious<CR>
" nnoremap <leader> :BufferNext<CR>

"  Info to use
" af: a function
" if: inner function
" ac: a class
" ic: inner class
" It also provides a few motions in normal and operator-pending mode:
" 
" [pf / ]pf: move to next/previous function
" [pc / ]pc: move to next/previous class
"
" ai	An Indentation level and line above.
" ii	Inner Indentation level (no line above).
" aI	An Indentation level and lines above/below.
" iI	Inner Indentation level (no lines above/below).
"
" zf - fold 
" za - unfold
