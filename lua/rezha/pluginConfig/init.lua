---
-- @file lua/rezha/pluginConfig/init.lua
--
-- @brief
-- The initialization file to call plugin configurations files.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local location = "rezha.pluginConfig"

require( location .. ".cmp" )
require( location .. ".lsp" )
require( location .. ".telescope" )
require( location .. ".treesitter" )
require( location .. ".autopairs" )
require( location .. ".comment" )
require( location .. ".nvim-tree" )
require( location .. ".bufferline" )
require( location .. ".lualine" )
require( location .. ".gitsigns" )
