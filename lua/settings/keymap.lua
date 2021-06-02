function keymap(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
    nowait = true,
    silent = true,
    noremap = true,
  }))
end

-- TODO: Change c to C in ctrl mappings
-- Reloading lua file
keymap('n', '<Leader><CR>', '<cmd>lua reload()<CR>')

-- Saving
keymap('i', '<c-s>', '<C-o>:w<CR>', { noremap = false })
keymap('n', '<c-s>', ':w<CR>', { noremap = false })
keymap('n', '<c-q>', ':wq!<CR>', { noremap = false })

-- Moving between slits
keymap('n', '<c-h>', '<C-w>h')
keymap('n', '<c-j>', '<C-w>j')
keymap('n', '<c-k>', '<C-w>k')
keymap('n', '<c-l>', '<C-w>l')
keymap('n', '<c-h>', '<C-\\><C-n><C-w>h')
keymap('n', '<c-l>', '<C-\\><C-n><C-w>l')

-- Resize slits
keymap('n', '<C-Up>', ':resize -2<CR>')
keymap('n', '<C-Down>', ':resize +2<CR>')
keymap('n', '<C-Right>', ':vertical resize -2<CR>')
keymap('n', '<C-Left>', ':vertical resize +2<CR>')

-- Moving between buffers
keymap('n', '<Leader>bn', ':BufferNext<CR>')
keymap('n', '<Leader>bp', ':BufferPrevious<CR>')
keymap('n', '<Leader>bc', ':BufferClose<CR>')

-- Close all buffers except current one
keymap('n', '<Leader>bac', ':silent w <BAR> :silent %bd <BAR> e#<CR>')

-- Handling copy/pasting on Windows
keymap('v', '<C-c>', '"+y')
keymap('i', '<C-v>', '<Esc>"+p')
keymap('n', '<C-v>', '"+p')

-- Move a selected line up/down
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- Indenting in visual mode
keymap('x', '<s-tab>', '<gv')
keymap('x', '<tab>', '>gv')

-- Delete line in visual
keymap('x', 'd', '"_d')

-- Escaping insert mode
keymap('i', 'jk', '<ESC>')
keymap('i', 'kj', '<ESC>')
keymap('i', 'jj', '<ESC>')

-- Filetree (kyazdani42/nvim-tree.lua)
keymap('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')

-- Commentary (b3nj5m1n/kommentary)
keymap('n', '<Leader>c', 'gcc', { noremap = false })
keymap('v', '<Leader>c', 'gc<BAR><Esc>', { noremap = false })

-- Git (tpope/fugitive)
-- TODO: Remove for gitui whenever change happens
keymap('n', '<Leader>gs', '<cmd>G<CR>', { noremap = false })
keymap('n', '<Leader>ga', '<cmd>Git add .<CR>', { noremap = false })
keymap('n', '<Leader>gl', '<cmd>Git log<CR>', { noremap = false })
keymap('n', '<Leader>gc', '<cmd>Git commit<CR>', { noremap = false })
keymap('n', '<Leader>gph', '<cmd>Git push<CR>', { noremap = false })
keymap('n', '<Leader>gpl', '<cmd>Git pull<CR>', { noremap = false })

-- Telescope (nvim-telescope/telescope.nvim)
keymap('n', '<Leader>p', '<cmd>Telescope find_files<CR>')
keymap('n', '<Leader>bu', '<cmd>Telescope buffers<CR>')
keymap('n', '<Leader>f', '<cmd>Telescope live_grep<CR>')

-- Terminal (akinsho/nvim-toggleterm.lua)
keymap('n', '<Leader>t', '<cmd>ToggleTerm<CR>')
keymap('t', '<Leader>t', '<cmd>ToggleTerm<CR>')

-- Starfity (mhinz/vim-startify)
keymap('n', '<Leader>ss', '<cmd>SSave<CR>')
keymap('n', '<Leader>sl', '<cmd>SLoad<CR>')
keymap('n', '<Leader>sd', '<cmd>SDelete<CR>')