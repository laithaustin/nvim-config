local nv_configs = require("nvchad.configs.lspconfig")
local on_attach = nv_configs.on_attach
local on_init = nv_configs.on_init
local capabilities = nv_configs.capabilities
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

local function enable_server(name, opts)
  local config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }, opts or {})

  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

for _, server in ipairs({ "html", "cssls", "clangd" }) do
  enable_server(server)
end

enable_server("basedpyright", {
  cmd = { mason_bin .. "basedpyright-langserver", "--stdio" },
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "standard",
      },
    },
  },
})

enable_server("ruff", {
  cmd = { mason_bin .. "ruff", "server" },
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    on_attach(client, bufnr)
  end,
})

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
