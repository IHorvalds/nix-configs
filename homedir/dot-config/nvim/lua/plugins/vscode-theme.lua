return {
    "Mofiqul/vscode.nvim",
    config = function()
        local vscode = require("vscode")

        vscode.setup({
            transparent = false,
            italic_comments = true,
            italic_inlayhints = true,
        })

        vscode.load()
    end,
}
