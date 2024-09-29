return {
    { 'williamboman/mason.nvim' },           -- Installer for external tools
    { 'williamboman/mason-lspconfig.nvim' }, -- mason extension for lspconfig
    { 'hrsh7th/nvim-cmp' },                  -- Autocomplete engine
    { 'hrsh7th/cmp-nvim-lsp' },              -- Completion source for LSP
    { 'L3MON4D3/LuaSnip' },                  -- Snippet engine
    {
        'neovim/nvim-lspconfig',             -- LSP configurations
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local luasnip = require('luasnip')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({
                    -- ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
            })

            local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = lsp_cmds,
                desc = 'LSP actions',
                callback = function()
                    local bufmap = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = true, desc = desc })
                    end

                    bufmap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<cr>', "LSP Hover")
                    bufmap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', "Go to Definition")
                    bufmap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go to Declaration")
                    bufmap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', "Go to Implementation")
                    bufmap('n', '<leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Go to Type Definition")
                    bufmap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', "Go to References")
                    bufmap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', "Signature Help")
                    bufmap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', "Rename")
                    bufmap({ 'n', 'x' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "Format")
                    bufmap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', "LSP Action")
                    -- bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
                    -- bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                    -- bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
                end
            })

            local lspconfig = require('lspconfig')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    -- 'tsserver',
                },
                handlers = {
                    function(server)
                        lspconfig[server].setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    --[[
                    ['tsserver'] = function()
                        lspconfig.tsserver.setup({
                            capabilities = lsp_capabilities,
                            settings = {
                                completions = {
                                    completeFunctionCalls = true
                                }
                            }
                        })
                    end
                    --]]
                }
            })
        end
    },
}
