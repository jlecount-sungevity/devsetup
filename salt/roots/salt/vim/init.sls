# pkg.install
vim:
    pkg:
        - installed
       
~/.vimrc:
  file:
    - managed
    - source: salt://vim/vimrc
    - require:
      - pkg: vim
