local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Mason-lspconfig not found")
  return
end

mason_lspconfig.setup({
  automatic_installation = true,
  handlers = {
    function (server_name)
      local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
      }

      if server_name == "lua_ls" then
        local luals_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", luals_opts, opts)
      end

      if server_name == "jsonls" then
        local jsonls_opts = require("user.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
      end

      require("lspconfig")[server_name].setup(opts)
    end
  }
})
