local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = true,
}
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
map('n', '<ESC>', '<Cmd>:noh<CR>', opts)
vim.keymap.set("n", "<c-p>", "<Plug>(YanksPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YanksNextEntry)")

-- Barbar mappings

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

map('n', '<A-n>', '<Cmd>enew<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- mini.surround shortcut
map('n', '<Leader>s', 'saiw', { noremap = false })
map('v', '<Leader>s', 'sa', { noremap = false })

