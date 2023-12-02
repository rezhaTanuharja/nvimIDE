---
-- @file lua/rezha/pluginConfig/lsp/settings/lua_ls.lua
--
-- @brief
-- The configuration file for the language server lua_ls.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
