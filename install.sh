#!/usr/bin/env bash
# Install dldg/vimrc for the current user. Idempotent: safe to re-run.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LINE="source $REPO_DIR/vimrc.vim"

say() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

if [ -f "$HOME/.vimrc" ] && grep -qxF "$LINE" "$HOME/.vimrc"; then
    say "~/.vimrc already sources $REPO_DIR/vimrc.vim"
else
    if [ -e "$HOME/.vimrc" ]; then
        bak="$HOME/.vimrc.bak.$(date +%Y%m%d%H%M%S)"
        mv "$HOME/.vimrc" "$bak"
        say "existing ~/.vimrc moved to $bak"
    fi
    printf '%s\n' "$LINE" >"$HOME/.vimrc"
    say "wrote ~/.vimrc"
fi
mkdir -p "$HOME/.vim/undo" && chmod 700 "$HOME/.vim/undo"

# Clipboard integration needs a +clipboard build
if ! command -v vim >/dev/null; then
    case "$(uname -s)" in
        Darwin) say "vim not found: brew install vim" ;;
        *)      say "vim not found: sudo apt install vim-gtk3   (includes +clipboard)" ;;
    esac
elif ! vim --version | grep -q '+clipboard'; then
    case "$(uname -s)" in
        Darwin) say "this vim lacks +clipboard: brew install vim" ;;
        *)      say "this vim lacks +clipboard: sudo apt install vim-gtk3" ;;
    esac
fi
say "done"
