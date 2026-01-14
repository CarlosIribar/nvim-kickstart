return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      provider = {
        enabled = 'tmux',
        tmux = {
          -- ...
        },
      },
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    -- Keymaps para opencode - evitando conflictos con <C-a> y <C-x> (increment/decrement nativos de Neovim)
    
    -- Preguntar a opencode sobre el texto actual o selección
    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = '[O]pencode [A]sk - Preguntar sobre texto actual' })

    -- Seleccionar y ejecutar acción de opencode
    vim.keymap.set({ 'n', 'x' }, '<leader>ox', function()
      require('opencode').select()
    end, { desc = '[O]pencode E[x]ecute - Seleccionar acción' })
    
    -- Toggle para mostrar/ocultar opencode (funciona en normal y terminal)
    vim.keymap.set({ 'n', 't' }, '<leader>ot', function()
      require('opencode').toggle()
    end, { desc = '[O]pencode [T]oggle - Mostrar/ocultar interfaz' })

    -- Operador para agregar rango a opencode (ej: 5go para agregar 5 líneas)
    vim.keymap.set({ 'n', 'x' }, 'go', function()
      return require('opencode').operator '@this '
    end, { expr = true, desc = '[G]o [O]perator - Agregar rango a opencode' })

    -- Operador para agregar línea actual a opencode
    vim.keymap.set('n', 'goo', function()
      return require('opencode').operator '@this ' .. '_'
    end, { expr = true, desc = '[G]oo - Agregar línea actual a opencode' })

    -- Navegación en sesión de opencode (media página arriba/abajo)
    vim.keymap.set('n', '<leader>ou', function()
      require('opencode').command 'session.half.page.up'
    end, { desc = '[O]pencode [U]p - Media página arriba' })
    vim.keymap.set('n', '<leader>od', function()
      require('opencode').command 'session.half.page.down'
    end, { desc = '[O]pencode [D]own - Media página abajo' })
  end,
}
