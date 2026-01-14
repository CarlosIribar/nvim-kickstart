-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local mapper = function(mode, key, result, desc)
  vim.keymap.set(mode, key, result, { noremap = true, silent = false, desc = desc })
end

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- telescope commands
mapper('n', '<leader>fa', ':Telescope find_files<CR>')
mapper('n', '<leader>ff', ':Telescope git_files<CR>')
mapper('n', '<leader>fb', ':Telescope buffers<CR>')
mapper('n', '<leader>fg', ':Telescope live_grep<CR>')
mapper('n', '<leader>fh', ':Telescope help_tags<CR>')
mapper('n', '<leader>fr', ':Telescope git_branches<CR>')
mapper('n', '<leader>fe', ':Telescope git_status<CR>')
mapper('n', '<leader>fs', ':Telescope luasnip<CR>')

--
mapper('n', '<leader>w', ':w<CR>', 'save')
mapper('n', '<leader>q', ':q<CR>', 'quit')
mapper('n', '<leader>p', '"*p', 'system paste')
mapper('n', '<leader>y', '"*y', 'system copy')

-- go to the previous buffer file
mapper('n', '<leader>,', '<C-^>', 'Toogle between current and last buffer')

-- NeoTree
mapper('n', '<leader>pt', ':Neotree position=left toggle <CR>', 'system copy')

-- Copilot chat
mapper('n', '<leader>cc', ':CopilotChatToggle<CR>', 'Copilot chat')
mapper('n', '<leader>cs', ':CopilotChatSave ', 'Copilot save')
mapper('n', '<leader>cp', ':CopilotChatPrompts<CR>', 'Copilot prompts')
mapper('n', '<leader>cm', ':CopilotChatModels<CR>', 'Copilot models')

mapper('n', '<leader>n', ':set nu! <CR>', 'See line number')
mapper('n', '<leader>rn', ':set rnu! <CR>', 'See relative line number')

-- LSP keymaps
mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', 'LSP go to definition')
mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>', 'LSP hover info')

-- Tmux navigation
mapper('n', '<C-h>', ':TmuxNavigateLeft<CR>', 'Tmux window left')
mapper('n', '<C-l>', ':TmuxNavigateRight<CR>', 'Tmux window right')
mapper('n', '<C-j>', ':TmuxNavigateDown<CR>', 'Tmux window down')
mapper('n', '<C-k>', ':TmuxNavigateUp<CR>', 'Tmux window up')

-- vim: ts=2 sts=2 sw=2 et
vim.keymap.set('n', 'y', 'y', { noremap = true })
vim.keymap.set('v', 'y', 'y', { noremap = true })
