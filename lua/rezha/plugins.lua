---
-- @file lua/rezha/plugins.lua
--
-- @brief
-- The configuration file to manage and install plugins.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

-- | Alias function to call vim function
local fn = vim.fn

-- set packer's installation path relative to nvim's data directory
local installPath = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- clone packer repository and install if installation is missing
if fn.empty( fn.glob( installPath ) ) > 0 then

  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", installPath
  }

  vim.notify( "Close and reopen nvim for changes to take effect" )
  vim.cmd [[packadd packer.nvim]]

end

local success, packer = pcall( require, "packer" )
if not success then
  vim.notify( "Error loading plugin: packer" )
  return
end

-- use popup window for packer
packer.init {
  display = {
    open_fn = function()
      return require( "packer.util" ).float { border = "rounded" }
    end,
  },
}

return packer.startup( function( use )

  -- packer manages itself
  use "wbthomason/packer.nvim"

  -- useful plugins for many other plugins
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- default vs code colorscheme
  use "Mofiqul/vscode.nvim"

  -- autocompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- language server protocol with mason
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- highlight occurences of current text
  use "RRethy/vim-illuminate"

  -- file finder and grep
  use "nvim-telescope/telescope.nvim"

  -- syntax highlighting
  use "nvim-treesitter/nvim-treesitter"

  -- autopair brackets and quotes
  use "windwp/nvim-autopairs"

  -- comment or uncomment lines of code
  use "numToStr/Comment.nvim"

  -- tree file explorer
  use "kyazdani42/nvim-tree.lua"

  -- tab-like appearance
  use "akinsho/bufferline.nvim"

  -- close buffer without closing window
  use "moll/vim-bbye"

  -- show meta data at the bottom of the screen
  use "nvim-lualine/lualine.nvim"

  -- git status and signs
  use "lewis6991/gitsigns.nvim"

  if PACKER_BOOTSTRAP then
    require( "packer" ).sync()
  end

end )
