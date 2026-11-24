. "$HOME/.cargo/env"

# Non-interactive shells (editors, scripts, MCP servers) read only this file,
# so mise tools reach them through shims. Interactive shells still run
# `mise activate` in .zshrc, which puts the real install dirs ahead of these.
case ":$PATH:" in
    *":$HOME/.local/share/mise/shims:"*) ;;
    *) export PATH="$HOME/.local/share/mise/shims:$PATH" ;;
esac

# Claude Code session scratchpads default to /tmp, which the OS cleans after a
# few idle days while the session can still be resumed.
export CLAUDE_CODE_TMPDIR="$HOME/.cache/claude-tmp"
