# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Lazygit

Add the following to `~/.config/lazygit/config.yml` to open files in the main neovim window when pressing `e` (instead of a new tab), and close the lazygit float afterwards:

```yaml
os:
  edit: "nvim --server $NVIM --remote-send '<C-\\><C-n>:silent! close<CR>' && nvim --server $NVIM --remote {{filename}}"
  editAtLine: "nvim --server $NVIM --remote-send '<C-\\><C-n>:silent! close<CR>' && nvim --server $NVIM --remote +{{line}} {{filename}}"
  editInTerminal: false
  openDirInEditor: false
```

How it works:
1. `--remote-send '<C-\><C-n>:silent! close<CR>'` — exits terminal mode and closes the lazygit float
2. `--remote {{filename}}` — opens the file in the now-focused main window

`$NVIM` is set automatically by neovim when lazygit runs inside a neovim terminal. No extra tools (e.g. `nvr`) needed.

### AI Commit Message

Press `Ctrl+a` in the files panel to generate an AI commit message using [aicommit2](https://github.com/tak-bro/aicommit2). The generated message is pre-filled when you press `c` to commit.

```yaml
customCommands:
  - key: "<c-a>"
    description: "Generate AI commit message"
    command: "aicommit2 -c && pbpaste > .git/LAZYGIT_PENDING_COMMIT"
    context: "files"
    output: "terminal"
```
