# Commands

## Navigation

- "<leader>pf" --> fzf search files
- "<C-d>" --> Jump half page down
- "<C-u>" --> Jump half page up

## Yanking and pasting

- "<leader>p" --> Paste without replacing
- "<leader>d" --> Delete without copying
- "x" --> Delete a character without copying to clipboard
- "<leader>s" --> Replace the word I'm on
- "<leader>x" --> Set the current file as executable

## Tab management

- "<leader>to" --> Open new tab
- "<leader>tx" --> Close current tab
- "<leader>tn" --> Go to next tab
- "<leader>tp" --> Go to prev tab
- "<leader>tf" --> Open current tab into a new one

## Split management

- "<leader>sv" --> Split window vertically
- "<leader>sh" --> Split window horizontally
- "<leader>se" --> Make split equal size
- "<leader>sx" --> Close current split

# Plugin's commands

## Workspace session (auto-session)

- "<leader>ws" --> Save workspace session
- "<leader>wr" --> Restore last workspace session

## Emmet abbreviations (nvim-emmet)

- "<leader>xe" --> Wrap with abbreviation

## Formatting (conform)

- "<leader>mp" --> Format whole file or range (in visual mode)

## Git

### vim-fugitive

- "<leader>gg" --> Open Git
- "<leader>P" --> Push (only in vim-fugitive)
- "<leader>p" --> Pull --rebase (only in vim-fugitive)
- "<leader>t" --> Push -u origin (only in vim-fugitive)

### gitsigns

#### Navigation

- "]h" --> Next hunk
- "[h" --> Prev hunk

#### Actions

- "<leader>gs" --> Stage chunk
- "<leader>gr" --> Reset hunk
- "<leader>gs" --> Stage selected chunk
- "<leader>gr" --> Reset selected hunk
- "<leader>gS" --> Stage whole buffer
- "<leader>gR" --> Reset whole buffer
- "<leader>gu" --> Undo stage hunk
- "<leader>gp" --> Preview hunk
- "<leader>gbl" --> Blame line
- "<leader>gB" --> Toggle line blame
- "<leader>gd" --> Diff this
- "<leader>gD" --> Diff this ~

### lazygit

- "<leader>lg" --> Open Lazy Git

## Linting (nvim-lint)

- "<leader>l" --> Trigger linting for current file

## File explorer (mini.files)

- "<leader>ee" --> Open file explorer
- "<leader>ef" --> Open file explorer into current open file
