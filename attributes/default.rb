default['vim']['plugins'] = %w(
  VundleVim/Vundle.vim
  kien/ctrlp.vim
  scrooloose/nerdtree
  tomtom/tlib_vim
  ntpeters/vim-better-whitespace
  garbas/vim-snipmate
  rking/ag.vim
  scrooloose/nerdcommenter
  MarcWeber/vim-addon-mw-utils
  jelera/vim-javascript-syntax
  mark-maxwell/vim-spec-split
  leafgarland/typescript-vim
  Quramy/tsuquyomi
)
default['vim']['colorscheme'] = 'monokai'

if platform?('centos')
  default['vim']['user'] = 'vagrant'
elsif platform?('ubuntu')
  default['vim']['user'] = 'ubuntu'
end
