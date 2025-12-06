local lspconfig = vim.lsp.config
local configs = require('lspconfig/configs')

-- lspconfig.rust_analyzer.setup {
--     settings = {
-- 	['rust-analyzer'] = {},
--     }
-- }
-- lspconfig.lua_ls.setup {}
-- lspconfig.pyright.setup{}
--lspconfig.lua_ls.setup{
--    cmd = { "/home/ryan/gitclones/lua-language-server/bin/lua-language-server" },
--}
lspconfig("basedpyright.setup", {})
