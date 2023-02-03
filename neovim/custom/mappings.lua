local M = {}

M.general = {
  i = {
    ["kj"] = { "<Esc>", "enter normal mode", opts = { nowait = true } },
  },
  n = {
    ["<Leader>y"] = { "\"+y", "copy to system clipboard", opts = { nowait = true } },
    ["<Leader>Y"] = { "\"+Y", "copy to system clipboard", opts = { nowait = true } },
    ["<Leader>p"] = { "\"+p", "paste from system clipboard", opts = { nowait = true } },
    ["<Leader>P"] = { "\"+P", "paste from system clipboard", opts = { nowait = true } },
  },
}

return M
