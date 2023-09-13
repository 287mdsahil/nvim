local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvimtree.setup({
  sort_by = "case_sensitive",
  hijack_cursor = true,
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  on_attach = nvimtree_on_attach,
})
