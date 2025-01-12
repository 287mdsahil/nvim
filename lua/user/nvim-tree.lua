local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function nvimtree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local useful_keys = {
    ["l"] = { api.node.open.edit, opts "Open" },
    ["o"] = { api.node.open.edit, opts "Open" },
    ["<CR>"] = { api.node.open.edit, opts "Open" },
    ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
    ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },
    ["C"] = { api.tree.change_root_to_node, opts "CD" },
  }

  for key, value in pairs(useful_keys) do
    vim.keymap.set('n', key, value[1], value[2])
  end
end



nvimtree.setup({
  sort_by = "case_sensitive",
  hijack_cursor = true,
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  on_attach = nvimtree_on_attach,
})
