---
-- @file lua/rezha/colorscheme.lua
--
-- @brief
-- The configuration file to set color schemes.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local colorScheme = "vscode"

local success, _ = pcall( vim.cmd, "colorscheme " .. colorScheme )
if not success then
  vim.notify( "Error loading colorscheme: " .. colorScheme )
  return
end
