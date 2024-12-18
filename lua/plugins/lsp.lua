return {
    { "williamboman/mason.nvim" },           -- Installer for external tools
    { "williamboman/mason-lspconfig.nvim" }, -- mason extension for lspconfig
    { "hrsh7th/cmp-nvim-lsp" },              -- Completion source for LSP
    { "hrsh7th/cmp-path" },                  -- Completion source for FS paths
    { "hrsh7th/cmp-buffer" },                -- Completion for words in different buffers
    { "L3MON4D3/LuaSnip" },                  -- Snippet engine
    {
        "hrsh7th/nvim-cmp",                  -- Autocomplete engine
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }
            -- Set view to follow cursor while typing
            opts.view = {
                entries = {
                    follow_cursor = true,
                },
            }
        end,
    },
    {
        "neovim/nvim-lspconfig", -- LSP configurations
        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local luasnip = require("luasnip")

            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "buffer",   keyword_length = 2 },
                    { name = "luasnip",  keyword_length = 3 },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
            })

            local lsp_cmds = vim.api.nvim_create_augroup("lsp_cmds", { clear = true })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = lsp_cmds,
                desc = "LSP actions",
                callback = function()
                    local bufmap = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = true, desc = desc })
                    end

                    bufmap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", "LSP Hover")
                    bufmap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition")
                    bufmap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declaration")
                    bufmap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation")
                    bufmap("n", "<leader>lo", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to Type Definition")
                    bufmap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", "Go to References")
                    bufmap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help")
                    bufmap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
                    -- bufmap({ 'n', 'x' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "Format")
                    bufmap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP Action")
                    -- bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
                    -- bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                    -- bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
                end,
            })

            local _border = "rounded"

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = _border
                }
            )

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help, {
                    border = _border
                }
            )

            vim.diagnostic.config {
                float = { border = _border }
            }

            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "html",
                    "cssls",
                    "css_variables",
                    "ts_ls",
                    "lua_ls",
                    "angularls",
                },
                handlers = {
                    function(server)
                        lspconfig[server].setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    ["rust_analyzer"] = function() end,
                },
            })
        end,
    },
}
