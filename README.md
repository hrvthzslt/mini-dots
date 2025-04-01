# Mini Dots

**The Minimalist CLI Development Environment**

[![asciicast](https://asciinema.org/a/eJ6oK0Gc4GrRD0zLrQthPjbMt.svg)](https://asciinema.org/a/eJ6oK0Gc4GrRD0zLrQthPjbMt)

## Text Editor

**Vim** without plugins, providing features like:

- File navigation (with **Netrw**) and search (with **wildmenu**)
- Code navigation (with **ctags** and **grep**)
- Further easing navigation with **marks** and the **quickfix list**
- Built-in auto-completion (enhanced with **ctags**) invoked automatically

## Screen Management

**Tmux** for:

- Managing screen space
- Managing multiple sessions
- With **vi bindings**

## Automation

- **POSIX** compliant shell scripts
- Structured with functions
- Organized in a **Makefile**

## Cheat Sheet

### Scripts

| Command | Operation                                                        |
| ------- | ---------------------------------------------------------------- |
| `se`    | Start a new **tmux** session with pwd basename or attaches to it |

### Tmux

Not including defaults.

| Key Binding  | Function                         |
| ------------ | -------------------------------- |
| `Ctrl + a`   | Prefix key for **tmux** commands |
| `Prefix + h` | Select left pane                 |
| `Prefix + j` | Select down pane                 |
| `Prefix + k` | Select up pane                   |
| `Prefix + l` | Select right pane                |

### Vim

Not including defaults, but having some really unnecessary ones. You can judge it.

| Key Binding              | Function                                             |
| ------------------------ | ---------------------------------------------------- |
| `Space`                  | Leader                                               |
| `Leader + k`             | Clear search highlight                               |
| `Leader + q`             | Close current buffer                                 |
| `Leader + Q`             | Close all buffers                                    |
| `Leader + w`             | Write current buffer                                 |
| `Leader + W`             | Write all buffers                                    |
| `Leader + sb`            | Switch between open buffers                          |
| `Leader + sf`            | Search for file                                      |
| `Leader + sg`            | Search in files                                      |
| `gr`                     | Search for word under cursor, and open quickfix list |
| `gd`                     | Go to tag or definition                              |
| `Leader + t`             | Regenerate tags in working directory                 |
| `Leader + n`             | Jump to next quickfix list item                      |
| `Leader + p`             | Jump to previous quickfix list item                  |
| `Leader + c`             | Open quickfix list                                   |
| `Leader + U`,`I`,`O`,`Z` | Add a global mark                                    |
| `Leader + u`,`i`,`o`,`z` | Jump to global mark                                  |
| `-`                      | Open Netrw (File Explorer)                           |
