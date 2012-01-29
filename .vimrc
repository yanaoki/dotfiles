"vi互換なし
set nocompatible


"行番号
set number
set showmatch


"フォールド(折りたたみ)無し
set nofoldenable


"シンタックハイライト
syntax on


"色テーマ
colorscheme gardener


"ファイルタイプ
filetype on
filetype indent on
filetype plugin on


"インデント
au FileType ruby set ts=2 sw=2 expandtab


" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-N>"
    else
      return "\<C-N>\<C-P>"
    end
  endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key


"ポップアップの色
hi Pmenu ctermbg=gray guibg=gray ctermfg=white guifg=white  
hi PmenuSel ctermbg=lightblue guibg=lightblue guifg=white ctermfg=white


"rubycomplete.vim
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1


"rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb" 
