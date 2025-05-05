vim.filetype.add {
  extension = {
    cls = 'apexcode', -- o "apexcode", como prefieras
    trigger = 'trigger', -- o "apexcode", como prefieras
    cmp = 'html', -- o "apexcode", como prefieras
  },
}

-- treesitter apex language registratio
vim.treesitter.language.register('apex', 'apexcode') -- read apex code as java
vim.treesitter.language.register('apex', 'cls') -- read apex code as java
vim.treesitter.language.register('apex', 'trigger') -- read apex code as java
vim.treesitter.language.register('apex', 'apex') -- read apex code as java
vim.treesitter.language.register('cmp', 'html') -- read apex code as java
vim.treesitter.language.register('app', 'html') -- read apex code as java

-- local lspconfig = require 'lspconfig'
--
-- lspconfig.apex_ls.setup {
--   cmd = {
--     'java',
--     '-jar',
--     '/Users/carlosiribar/nvim/apex-jorje-lsp.jar',
--   },
--   filetypes = { 'apex', 'cls', 'trigger', 'st' },
--   settings = {
--     apex_enable_semantic_errors = true,
--     apex_enable_completion_statistics = false,
--     apex_completion_filter_camelcase = true,
--     apex_completion_filter_case_insensitive = true,
--     apex_completion_filter_case_sensitive = false,
--     apex_enable_code_actions = true,
--     apex_jar_path = '/Users/carlosiribar/nvim/apex-jorje-lsp.jar',
--     apex_format_debug_level = 'info',
--     apex_completion_trigger_characters = { '.', ':', '<', '"', '=', '(' },
--   },
-- }
