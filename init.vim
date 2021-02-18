" ---- Functions ----
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" ---- Plugins ------
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'preservim/nerdtree'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
call plug#end()

" ----- Configs -----
" ALE plugin config
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '‚ùå'
let g:ale_sign_warning = '‚ö†Ô∏è'
let g:ale_fix_on_save = 1

" Color Scheme
set termguicolors 
let ayucolor="mirage"
colorscheme ayu

" CtrlSF
let g:ctrlsf_default_root = 'cwd'
let g:ctrlsf_backend = 'ack'
let g:ctrlsf_ignore_dir = ['node_modules', 'dist', 'coverage', 'json_report']
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_focus = { "at": "start" }

" General
set relativenumber
syntax on
set tabstop=2
set shiftwidth=2
set expandtab

" ---- Key mappings ----
" Open FZF search
nnoremap <silent> <C-p> :FZF<CR>

" Open Buffers
nnoremap <silent> <C-b> :Buffers<CR>

" Nerd Tree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

" CtrlSF
nmap <C-F>f <Plug>CtrlSFPrompt
nmap <C-F>n <Plug>CtrlSFCwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>

" ALE
nmap <silent> <C-n> :ALENext<cr>
nmap <silent> <C-m> :ALEPrevious<cr>

" General
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
