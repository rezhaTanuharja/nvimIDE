---
-- @file lua/rezha/pluginConfig/cmp.lua
--
-- @brief
-- The configuration file for the completion plugins.
--
-- @author Rezha Adrian Tanuharja
-- @date 2023-12-01
--

local success, cmp = pcall( require, "cmp" )
if not success then
  vim.notify( "Error loading plugin: cmp" )
  return
end

local luasnip
success, luasnip = pcall( require, "luasnip" )
if not success then
  vim.notify( "Error loading plugin: luasnip" )
  return
end

require( "luasnip/loaders/from_vscode" ).lazy_load()

local checkBackspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline( "." ):sub( col, col ):match "%s"
end

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = " ",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = " ",
  Misc = " ",
}

cmp.setup {
  snippet = {
    expand = function( args )
      luasnip.lsp_expand( args.body )
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping( cmp.mapping.scroll_docs( -1 ), { "i", "c" } ),
    ["<C-f>"] = cmp.mapping( cmp.mapping.scroll_docs( 1 ), { "i", "c" } ),
    ["<C-Space>"] = cmp.mapping( cmp.mapping.complete(), { "i", "c" } ),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(
      function( fallback )
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif checkBackspace() then
          fallback()
        else
          fallback()
        end
      end,
      { "i", "s", }
    ),
    ["<S-Tab>"] = cmp.mapping(
      function( fallback )
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }
    ),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
