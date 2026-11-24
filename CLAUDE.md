# Dotfiles

This repository is public and holds only what a fresh machine needs to start a working shell and git before the private dotfiles are cloned. Add every other setting to the private dotfiles, whose `~/.zshenv.private`, `~/.zshrc.private` and `~/.gitconfig.private` are read here when present.

## Symlink Structure

```
~/.zshenv        -> .dotfiles/.zshenv
~/.zshrc         -> .dotfiles/.zshrc
~/.gitconfig     -> .dotfiles/.gitconfig
~/.gitignore     -> .dotfiles/.gitignore
~/.gitattributes -> .dotfiles/.gitattributes
```

`~/.gitconfig.local` is a per-machine file holding the git identity and signing key.
