#!/usr/bin/env bash
set -euo pipefail

if [ ! -f themes/hexo-theme-next/_config.yml ]; then
  rm -rf themes/hexo-theme-next
  git clone --depth 1 https://github.com/theme-next/hexo-theme-next.git themes/hexo-theme-next
elif [ -f .gitmodules ]; then
  git submodule update --init --recursive
fi

npx hexo generate
