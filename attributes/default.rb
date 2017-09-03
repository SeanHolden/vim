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
  mark-maxwell/vim-spec-split
  pangloss/vim-javascript
  mxw/vim-jsx
)
default['vim']['colorscheme'] = 'monokai'

if platform?('centos')
  default['vim']['user'] = 'vagrant'
elsif platform?('ubuntu')
  default['vim']['user'] = 'ubuntu'
end
