local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("LSP config not found")
  return
end

require("dxas90.lsp.lsp-installer")
require("dxas90.lsp.handlers").setup()
require("dxas90.lsp.null-ls")
