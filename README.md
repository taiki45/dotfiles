# Dotfiles

The minimal shell and git setup for a fresh machine. The rest lives in a private repository, read through `~/.zshenv.private`, `~/.zshrc.private` and `~/.gitconfig.private` when present.

```sh
git clone https://github.com/taiki45/dotfiles.git ~/.dotfiles
for f in .zshenv .zshrc .gitconfig .gitignore .gitattributes; do ln -sfn ~/.dotfiles/$f ~/$f; done
```

On Linux, `ssh-agent.service` is a systemd user unit serving the `SSH_AUTH_SOCK` that `.zshrc` sets.

terminal color scheme: Dracula

## LICENSE

The MIT License (MIT)

Copyright (c) 2013 Taiki ONO (@taiki45)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
