. "$HOME/.cargo/env"

# Non-interactive shells (editors, scripts, MCP servers) read only this file,
# so mise tools reach them through shims. Interactive shells still run
# `mise activate` in .zshrc, which puts the real install dirs ahead of these.
case ":$PATH:" in
    *":$HOME/.local/share/mise/shims:"*) ;;
    *) export PATH="$HOME/.local/share/mise/shims:$PATH" ;;
esac

[[ -r ~/.zshenv.private ]] && source ~/.zshenv.private
