---
-- @file lua/rezha/pluginConfig/telescope.lua
--
-- @brief
-- The configuration file for the plugin telescope.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local success, telescope = pcall( require, "telescope" )
if not success then
  vim.notify( "Error loading plugin: telescope" )
  return
end

local actions
success, actions = pcall( require, "telescope.actions" )
if not success then
  vim.notify( "Error loading plugin module: telescope actions" )
  return
end

telescope.setup {
  defaults = {

    prompt_prefix = "",
    selection_caret = "  ",
    path_display = { "full" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
    file_ignore_patterns = {
      "%.bin",
      "%.cmake",
      "%.check_cache",
      "%.dir",
      "%.docx",
      "%.gif",
      "%.jpg",
      "%.jpeg",
      "%.key",
      "%.make",
      "%.o",
      "%.out",
      "%.make",
      "%.marks",
      "%.pdf",
      "%.png",
      "%.pptx",
      "%.pyc",
      "%.so",
      "%.vtu",
      "%.wav",
      "%.xlsx",
      "%.yaml",
    },
  },
  pickers = {
    planets = {
      show_pluto = true,
    },
  },
  extensions = {
  },
}

