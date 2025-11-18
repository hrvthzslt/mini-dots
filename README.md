# Mini Dots

**The Minimalist CLI Development Environment**

[![asciicast](https://asciinema.org/a/eJ6oK0Gc4GrRD0zLrQthPjbMt.svg)](https://asciinema.org/a/eJ6oK0Gc4GrRD0zLrQthPjbMt)

## Text Editor

**Vim** without plugins, providing features like:

- File navigation (with **Netrw**) and search (with **wildmenu**)
- Code navigation (with **ctags** and **grep**)
- Further easing navigation with **marks** and the **quickfix list**
- Built-in auto-completion (enhanced with **ctags**) invoked automatically
- Edit-compile-edit cycle, with **makeprg** and **quickfix list**
- Language specific formatting

## Screen Management

**Tmux** for:

- Managing screen space
- Managing multiple sessions
- With **vi bindings**

## Automation

- **POSIX** compliant shell scripts
- Structured with functions
- Organized in a **Makefile**

Run `make` to see available commands.

## Extra Language Tools

Edit-compile-edit cycle support for the following languages: _shell_, _python_, _c_. These are not installed by default, run `make extra` to install them.

- **shellcheck** for shell script linting
- **shfmt** for shell script formatting
- **gcc** for C code compilation
- **clang-format** for C code formatting
- **ruff** for python linting and formatting

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
| `Ctrl + h/j/k/l`         | Navigate panes                                       |
| `Leader + sb`            | Switch between open buffers                          |
| `Leader + sf`            | Search for file                                      |
| `Leader + sg`            | Search in files                                      |
| `gr`                     | Search for word under cursor, and open quickfix list |
| `gd`                     | Go to tag or definition                              |
| `Leader + n`             | Jump to next quickfix list item                      |
| `Leader + p`             | Jump to previous quickfix list item                  |
| `Leader + c`             | Open quickfix list                                   |
| `Leader + t`             | Regenerate tags in working directory                 |
| `Leader + ll`            | Compile/lint/run based on filetype                   |
| `Leader + lf`            | Format with external tools based on filetype         |
| `Leader + U`,`I`,`O`,`Z` | Add a global mark                                    |
| `Leader + u`,`i`,`o`,`z` | Jump to global mark                                  |
| `-`                      | Open Netrw (File Explorer)                           |
| `Leader + ff`            | Diff visible panes                                   |
| `Leader + fo`            | Exit diff                                            |

## Auto Install

```shell
curl -fsSL  https://raw.githubusercontent.com/hrvthzslt/mini-dots/refs/heads/main/install | bash
```
