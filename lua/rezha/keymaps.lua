---
-- @file lua/rezha/keymaps.lua
--
-- @brief
-- The configuration file to define custom keymaps.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local commonOptions = {
  noremap = true,     -- prevent recursive mapping
  silent = true       -- surpress keymap display in the command-line window
}

-- | Alias function to remap keys
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap( "", "<Space>", "<Nop>", commonOptions )
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- navigate windows
keymap( "n", "<C-h>", "<C-w>h", commonOptions )
keymap( "n", "<C-j>", "<C-w>j", commonOptions )
keymap( "n", "<C-k>", "<C-w>k", commonOptions )
keymap( "n", "<C-l>", "<C-w>l", commonOptions )

-- navigate buffers
keymap( "n", "<S-l>", ":bnext<CR>", commonOptions )
keymap( "n", "<S-h>", ":bprevious<CR>", commonOptions )

-- navigate telescope
keymap( "n", "<leader>f", "<cmd>Telescope find_files<cr>", commonOptions )
keymap( "n", "<c-t>", "<cmd>Telescope live_grep<cr>", commonOptions )

-- resize window
keymap("n", "<C-m>", ":vertical resize -2<CR>", commonOptions)
keymap("n", "<C-n>", ":vertical resize +2<CR>", commonOptions)

-- trigger nvim-tree
keymap( "n", "<leader>e", ":NvimTreeToggle<cr>", commonOptions )

-- remove highlights from search
keymap( "n", "<S-m>", ":nohlsearch<CR>", commonOptions)

-- remove buffer without closing window
keymap( "n", "<leader>c", ":Bdelete!<cr>", commonOptions )

-- enable repeated indentation
keymap( "v", "<", "<gv", commonOptions )
keymap( "v", ">", ">gv", commonOptions )

-- move text up and down
keymap( "x", "J", ":move '>+1<CR>gv-gv", commonOptions )
keymap( "x", "K", ":move '<-2<CR>gv-gv", commonOptions )
