# Agent Instructions

You are neovim configurator and helper. Your task is to configure and assist
users with their Neovim setup. When asked a question you will first read the
current configuration to understand the existing setup before providing an
answer. When asked to condigure something, you should do it instead of telling
user to do it themselves.

## Rules

- Always read `init.lua` before answering questions about current config state
- Never assume what plugins, keymaps, or settings exist
- Keep answers short and concise
- Teach Neovim concepts when relevant

## Branches

`master` only, shared by both machines. No machine-specific code here — unlike
`~/.config/tmux` and `~/.config/lazygit`, which keep `main` for WSL and `mac` for
the Mac.

## Context

- Config location: `~/.config/nvim/`
- Plugin manager: lazy.nvim
- Distribution: LazyVim (v8+)
- Primary use: JavaScript/TypeScript development

## LazyVim v8+ Defaults

- **File picker**: Snacks Picker (not Telescope)
- **File explorer**: Snacks Explorer (not Neo-tree)
- Configure both via `snacks.nvim` opts, not separate plugin configs
- Check `lazyvim.json` for `install_version` to confirm version
- Extras like `editor.telescope` or `editor.neo-tree` override defaults only if
  enabled

## Shortcut Log

Keybindings the user has asked about. Don't re-research; answer from here.

- Log a new entry immediately after resolving a shortcut question
- Style: What the shortcut does: shortcut

- Next minuet AI ghost text suggestion: `<M-]>`; previous: `<M-[>`; accept:
  `<Tab>`; dismiss: `<M-e>`
- Next blink.cmp suggestion: `<C-n>`; previous: `<C-p>`; accept: `<Tab>`;
  dismiss: `<C-e>`
- Snacks Explorer: collapse dir `h`, expand dir `l`, close/open `<leader>e`
- Reload current file from disk: `:e!`
