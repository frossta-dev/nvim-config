# Frossta's Neovim Configuration

## Keymaps
`map leader = ' '`
### Normal Mode
| Command      | Description                |
| ------------ | -------------------------- |
| `<leader>re` | restart neovim             |
| `<leader>u`  | show undo tree             |
| `<leader>f`  | format local buffer        |
| `gd`         | go to definition           |
| `-`          | toggle mini file explorer  |
| `<leader>-`  | toggle to current file     |
| `<leader>pf` | Mini File Picker           |
| `<leader>ps` | Mini File Search           |
| `<leader>vh` | Mini Help                  |
| `<leader>xx` | mini picker diagnostics    |
| `<leader>pk` | search keymaps             |
| `<leader>gg` | fugitive full page new tab |
| `<leader>gd` | git diff split             |

### Visual Mode
| Command      | Description                |
| ------------ | -------------------------- |
| `J`          | moves lines down           |
| `K`          | moves lines up             |
| `<`          | unindent and keep selection|
| `>`          | indent and keep selection  |

### Both Modes
| Command      | Description                |
| ------------ | -------------------------- |
| `gsa`        | add surrounding            |
| `gsd`        | delete surrounding         |
| `gsf`        | find surrounding (right)   |
| `gsF`        | find surrounding (left)    |
| `gsh`        | highlight surrounding      |
| `gsr`        | replace surrounding        |
