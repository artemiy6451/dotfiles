-- Setup language servers.
local lspconfig = require('lspconfig')

-- Add lsp servers
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        flags = {
            debounce_text_changes = 150,
        },
    }
end

lspconfig.bashls.setup{}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the vim global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime filees
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>le', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>lp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<space>ln', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist)

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
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>ld', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>la', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>lf', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
