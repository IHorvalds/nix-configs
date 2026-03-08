return {
    "Mofiqul/vscode.nvim",
    config = function()
        local vscode = require("vscode")

        vscode.setup({
            transparent = true,
            italic_comments = true,
            italic_inlayhints = true,
        })

        vscode.load()
    end,
}
