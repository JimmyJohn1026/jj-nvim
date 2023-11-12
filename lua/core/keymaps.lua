-- key mappings

-- split management
vim.keymap.set("n", "<C-h>", "<C-w><") -- move left
vim.keymap.set("n", "<C-j>", "<C-w>-") -- move down
vim.keymap.set("n", "<C-k>", "<C-w>+") -- move up
vim.keymap.set("n", "<C-l>", "<C-w>>") -- move right

-- bind super to escape
--vim.keymap.set({'n', 'i', 'v', 't', 'c', 't', 's', 'o', 'l'}, '<super>', '<esc>', { noremap = true })

-- set leader key to space
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- plugin keymaps

-- nvim-tree
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeToggle<CR>")

-- toggleterm
--vim.api.nvim_set_keymap('i', '<leader>t', '<Esc>:<C-u>exe v:count1 .. "ToggleTerm"<CR>', { silent = true })

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  vim.keymap.set('t', '<C-t>', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], opts)
end

vim.api.nvim_set_keymap('n', '<leader>t', ':<C-u>exe v:count1 .. "ToggleTerm"<CR>', { silent = true })

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- lspconfig
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


