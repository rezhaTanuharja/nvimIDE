---
-- @file lua/rezha/pluginConfig/lsp/init.lua
--
-- @brief
-- The initialization file for LSP.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local success, _ = pcall( require, "lspconfig" )
if not success then
  vim.notify( "Error loading plugin: lspconfig" )
  return
end

local location = "rezha.pluginConfig.lsp"

require( location .. ".mason" )
require( location .. ".handlers" ).setup()
