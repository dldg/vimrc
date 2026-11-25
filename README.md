# vimrc

Vim configuration shared by Linux (Ubuntu) and macOS.

## Install

```bash
mkdir -p ~/git/dev-env && cd ~/git/dev-env
git clone https://github.com/dldg/vimrc
./vimrc/install.sh
```

The installer writes `~/.vimrc` as a single `source …/vimrc.vim` line. If a `~/.vimrc` already exists it is backed up first. The installer also creates `~/.vim/undo` for persistent undo.

To use the system clipboard you need a vim built with `+clipboard`:
- Ubuntu: `sudo apt install vim-gtk3`
- macOS: `brew install vim`

## Highlights
- Leader is `,`. `,<space>` clears the search highlight.
- Undo history persists across sessions.
- Prose (text, markdown, git commits) hard-wraps at 76 columns. Code doesn't wrap.
- C/C++ builds with `scons`. `:R [args]` runs `g:RunFile` (default `./build/a.out`).
- `:CdHere` changes to the current file's directory.
