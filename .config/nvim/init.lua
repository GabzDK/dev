-- Lazy fix
vim.g.mapleader = " "
vim.o.statusline = ""
vim.o.statusline = "%f %y %m %r %= %l/%L %c"
vim.g.snack_scope_lines_enabled = false

require("config.lazy")
require("config.options")
require("config.remap")
