---
-- @file lua/rezha/pluginConfig/comment.lua
--
-- @brief
-- The configuration file for the plugin comment.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local success, comment = pcall( require, "Comment" )
if not success then
  vim.notify( "Error loading plugin: comment" )
  return
end

comment.setup {}
