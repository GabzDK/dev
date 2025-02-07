-- Lazy fix
vim.g.mapleader = " "
vim.o.statusline = "%f %y %m %r %= %l/%L %c"

require("config.lazy")
require("config.options")
require("config.remap")
