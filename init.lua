--[[

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

  Next, run AND READ `:help`.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

  If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

 -- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

-- Set to true i you have a Nerd Font installed and selected in the terminal

-- [[ Setting options ]]
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
require 'options'
require 'apex'
require 'luasnip-config'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
