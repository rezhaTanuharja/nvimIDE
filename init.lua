---
-- @file init.lua
--
-- @brief
-- The initialization file to select user and call other configuration files.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local user = "rezha"

-- | Function to load configuration files with protected call.
local function loadConfig( filename )
  local success, _ = pcall( require, filename )
  if not success then
    vim.notify( "Error loading configuration file: " .. filename )
  end
end

-- call other configuration files
loadConfig( user .. ".options" )
loadConfig( user .. ".keymaps" )
loadConfig( user .. ".colorScheme" )
loadConfig( user .. ".plugins" )
loadConfig( user .. ".pluginConfig" )
