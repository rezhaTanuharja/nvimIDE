---
-- @file lua/rezha/pluginConfig/autopairs.lua
--
-- @brief
-- The configuration file for the plugin autopairs.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local success, autopairs = pcall( require, "nvim-autopairs" )
if not success then
  vim.notify( "Error loading plugin: autopairs" )
  return
end

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

autopairs.remove_rule('`')

local cmpAutopairs
success, cmpAutopairs = pcall( require, "nvim-autopairs.completion.cmp" )
if not success then
  vim.notify( "Error loading plugin module: autopairs cmp" )
  return
end

local cmp
success, cmp = pcall( require, "cmp" )
if not success then
  vim.notify( "Error loading plugin: cmp" )
  return
end

cmp.event:on( "confirm_done", cmpAutopairs.on_confirm_done { map_char = { tex = "" } } )
