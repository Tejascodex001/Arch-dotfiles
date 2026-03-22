# Cheatsheet — Neovim + tmux
> Productivity-first Arch setup | Kanagawa Dragon

---

## tmux

**Prefix = `Ctrl+A`**

### Panes
| Key | Action |
|-----|--------|
| `Prefix + \|` | Split vertically |
| `Prefix + -` | Split horizontally |
| `Alt + h/j/k/l` | Move between panes (no prefix) |
| `Prefix + H/J/K/L` | Resize pane |
| `Prefix + x` | Close pane |

### Windows
| Key | Action |
|-----|--------|
| `Alt + 1-5` | Jump to window |
| `Alt + n` | Next window |
| `Alt + p` | Previous window |
| `Prefix + ,` | Rename window |

### Sessions
| Key | Action |
|-----|--------|
| `Prefix + S` | New named session |
| `Prefix + s` | Pick session from list |
| `Prefix + X` | Kill current session |
| `Prefix + Ctrl+S` | Save session (resurrect) |
| `Prefix + Ctrl+R` | Restore session (resurrect) |

### Copy Mode
| Key | Action |
|-----|--------|
| `Prefix + Enter` | Enter copy mode |
| `v` | Start selection |
| `V` | Select whole line |
| `r` | Toggle rectangle selection |
| `y` | Copy to clipboard and exit |
| `H` | Go to start of line |
| `L` | Go to end of line |
| `Escape` | Cancel and exit |

### Other
| Key | Action |
|-----|--------|
| `Prefix + r` | Reload config |
| `Prefix + d` | Detach from session |
| `tmux attach -t dsa` | Reattach to DSA session |

---

## Neovim

**Leader = `Space`**

### File & Editor
| Key | Action |
|-----|--------|
| `i` | Enter insert mode |
| `Esc` | Return to normal mode |
| `Space + w` | Save |
| `Space + q` | Quit |
| `Space + x` | Save and quit |
| `Ctrl + p` | Find files (Telescope) |
| `Space + g` | Live grep (search in files) |

### Navigation
| Key | Action |
|-----|--------|
| `gg` | Go to top of file |
| `G` | Go to bottom of file |
| `Ctrl + d` | Scroll down (centered) |
| `Ctrl + u` | Scroll up (centered) |
| `0` | Start of line |
| `$` | End of line |
| `w` | Next word |
| `b` | Previous word |
| `%` | Jump to matching bracket |
| `{` / `}` | Jump between paragraphs |

### Editing
| Key | Action |
|-----|--------|
| `dd` | Delete line |
| `yy` | Copy line |
| `p` | Paste below |
| `P` | Paste above |
| `u` | Undo |
| `Ctrl + r` | Redo |
| `ciw` | Change inner word |
| `di"` | Delete inside quotes |
| `=G` | Auto-indent entire file |
| `gc` | Toggle comment (line) |

### Visual Mode
| Key | Action |
|-----|--------|
| `v` | Enter visual mode |
| `V` | Select whole line |
| `Ctrl + v` | Block selection |
| `J` | Move selection down |
| `K` | Move selection up |

### LSP (C++ and Python)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `Space + ca` | Code actions |
| `Space + rn` | Rename symbol |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Completion (nvim-cmp)
| Key | Action |
|-----|--------|
| `Tab` | Next suggestion |
| `Shift + Tab` | Previous suggestion |
| `Enter` | Confirm suggestion |
| `Ctrl + Space` | Trigger completion |

### Window Splits
| Key | Action |
|-----|--------|
| `:vs` | Vertical split |
| `:sp` | Horizontal split |
| `Ctrl + h/j/k/l` | Move between splits |

### DSA Workflow
| Command | Action |
|---------|--------|
| `dsa` | Open DSA tmux session |
| `cr file.cpp` | Compile and run |
| `cr file.cpp in.txt` | Compile and run with input |
| `cp ~/dsa/templates/main.cpp problem.cpp` | Start new problem |

---

## Quick Reference Card
```
DAILY FLOW
──────────────────────────────────────
dsa              → open DSA workspace
cr file.cpp      → compile and run
accent blue      → switch accent color
Super+P          → power menu
Super+L          → lock screen
Super+N          → toggle notifications
Super+V          → clipboard history
Print            → screenshot
Shift+Print      → screenshot region
F2/F3            → volume down/up
F5/F6            → brightness down/up
```
