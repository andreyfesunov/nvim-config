vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Go to Up window" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Go to Bottom window" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Go to Left window" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Go to Right window" })
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>", { desc = "Comment toggle" })

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>", { desc = "Vertical screen split" })
vim.keymap.set("n", "\\", ":split<CR>", { desc = "Horizontal screen split" })

-- Moving blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move block up" })

-- Other
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Go to normal mode" })

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>YY", '"+y', { desc = "Yank selected to PRIMARY" })
vim.keymap.set({ "n", "v" }, "<leader>PP", '"+p', { desc = "Paste selected to PRIMARY" })
vim.keymap.set({ "n", "v" }, "<leader>Yy", '"*y', { desc = "Yank selected to CLIPBOARD" })
vim.keymap.set({ "n", "v" }, "<leader>Pp", '"*p', { desc = "Paste selected to CLIPBOARD" })
-- vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yand line to system clipboard" })

-- Diagnostics
vim.keymap.set("n", "<leader>pf", vim.diagnostic.open_float, { desc = "Error Signature In Floating Window" })
