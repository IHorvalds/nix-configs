vim.lsp.config('clangd', {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "cc", "cxx", "h", "hpp" },
	root_markers = {
		{ "CMakeLists.txt", "Makefile" },
		{ ".clangd",        ".clang-format" },
		"compile_command.json"
	},
})
