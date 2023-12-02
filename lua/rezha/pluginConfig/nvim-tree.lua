---
-- @file lua/rezha/pluginConfig/nvim-tree.lua
--
-- @brief
-- The configuration file for the plugin nvim-tree.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local success, nvim_tree = pcall( require, "nvim-tree" )
if not success then
  vim.notify( "Error loading plugin: nvim-tree" )
  return
end

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "x",
        symlink = "s",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "[x]",
          open = "]x[",
          empty = "[ ]",
          empty_open = "] [",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "•",
      info = "•",
      warning = "•",
      error = "•",
    },
  },
  view = {
    width = 32,
    side = "left",
  },
}
