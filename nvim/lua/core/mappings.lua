-- Space as leader map
vim.g.mapleader = " "

-- jk for exit to normal mode 
vim.keymap.set("i","jk","<esc>",{noremap=true})

-------------------
----- NeoTree -----
-------------------
vim.keymap.set('n', '<leader>e', ':Neotree float focus toggle<CR>')
-- Show buffers 
vim.keymap.set('n', '<leader>b', ':Neotree float toggle show buffers<CR>')
-- Show Git
vim.keymap.set('n', '<leader>g', ':Git<CR>')

-- No highlight search
vim.keymap.set('n', ',<leader>', ':nohlsearch<CR>')

--Tab switch
vim.keymap.set('n', 'H', 'gT',{noremap=true})
vim.keymap.set('n', 'L', 'gt',{noremap=true})
vim.keymap.set('n', 'gn', ':bn<CR>',{noremap=true})
vim.keymap.set('n', 'gp', ':bn<CR>',{noremap=true})

-- Toggle comment
-- vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Undo Tree
vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- Restart Lsp
vim.keymap.set('n', '<leader>lR', ':LspRestart<CR>')
