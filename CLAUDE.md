# Dotfiles

## Symlink Structure

### Home Directory (`~`) → `.dotfiles/`

```
~/.zshenv        -> .dotfiles/.zshenv
~/.zshrc         -> .dotfiles/.zshrc
~/.vimrc         -> .dotfiles/.vimrc
~/.tigrc         -> .dotfiles/.tigrc
~/.gitconfig     -> .dotfiles/.gitconfig
~/.gitignore     -> .dotfiles/.gitignore
~/.gitattributes -> .dotfiles/.gitattributes
```

### Config Directory (`~/.config/`) → `.dotfiles/config/`

```
~/.config/lazygit -> .dotfiles/config/lazygit
```

## Private Overlays

This repository is public. Settings tied to work or AI agents go in `~/.zshenv.private` and `~/.zshrc.private` (and `~/.gitconfig.local` for git), which live in a private repository and are sourced here only when present.
