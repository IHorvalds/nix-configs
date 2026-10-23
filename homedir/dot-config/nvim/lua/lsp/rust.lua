vim.lsp.config("rust_analyzer", {
	root_markers = { ".cargo", "Cargo.toml" }
})
vim.lsp.enable("rust_analyzer")
