let g:python_host_prog  = '/Users/bi912605/.pyenv/versions/2.7.16/bin/python'
let g:python3_host_prog = '/Users/bi912605/.pyenv/versions/3.7.4/bin/python'
let g:ruby_host_prog = '/Users/bi912605/.rbenv/shims/ruby'
let g:node_host_prog = '/Users/bi912605/.nodebrew/current/bin/node'

set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set cursorline
set hls
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

:command UP UpdateRemotePlugins
