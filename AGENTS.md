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
  dismiss: `<C-e>`; show the menu by hand: `<C-space>`
- Snacks Explorer: toggle sidebar from anywhere `<leader>e` (opens and focuses it
  when closed, closes it when open); picking a file closes the sidebar; collapse
  dir `h`, expand dir `l`; go up one directory (tree starts at the parent)
  `<BS>` (file list only; from the search box press `<Esc>` then `/` first);
  make the directory under the cursor the tree top `.`
- Snacks Explorer: toggle hidden files `<M-h>`; toggle gitignored files `<M-i>` or `I`
- Snacks Explorer search (`/`): next found file `<C-n>`, `<C-j>` or `<Down>`;
  previous `<C-p>`, `<C-k>` or `<Up>`; open it `<CR>`; after `<Esc>` also `j`/`k`
- Reload current file from disk: `:e!`
- Copy entire file to system clipboard: `:%y+`
- Copy file path: `<leader>yp` (absolute), `<leader>yl` (path:line); plugin:
  `<leader>fyp` relative, `<leader>fyP` absolute, `<leader>fyn` filename
- Quit current window (closes the Snacks Explorer sidebar when focused): `:q`;
  quit all windows/exit Neovim: `:qa`; force without saving: `:qa!`
- Move forward through the jump list in Normal mode (opposite of `<C-o>`): `<C-i>`
- No global Neovim mappings; terminal fallback behaves like `<Esc>o` (open line
  below) and `<Esc>i` (insert before cursor): `<M-o>`, `<M-i>`
- Scroll the view without moving to another line (vertical): one line `<C-e>`
  down, `<C-y>` up; half screen `<C-d>` down, `<C-u>` up; full screen `<C-f>`
  down, `<C-b>` up. All Vim defaults, nothing remaps them here
- Scroll the view sideways (needs `nowrap`, the current setting): one column
  `zl` right, `zh` left; half screen `zL` right, `zH` left; jump so the cursor
  sits at the left edge `zs`, at the right edge `ze`
- Dismiss messages and notifications: `<leader>un` (Snacks notifications),
  `<leader>snd` (all noice messages); clear the bottom line `:echo ""`;
  message history `<leader>snh`, last message `<leader>snl`
