---
-- @file lua/rezha/pluginConfig/treesitter.lua
--
-- @brief
-- The configuration file for the plugin treesitter.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local success, configs = pcall( require, "nvim-treesitter.configs" )
if not success then
  vim.notify( "Error loading plugin: treesitter" )
  return
end

configs.setup {
  ensure_installed = {
    "c", "cmake", "cpp",
    "json",
    "latex",
    "lua",
    "markdown", "markdown_inline",
    "python",
    "sql",
  },
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },

}
