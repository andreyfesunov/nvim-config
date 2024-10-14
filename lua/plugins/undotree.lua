return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree toggle" })
        if jit.os == "Windows" then
            vim.g.undotree_DiffCommand = "FC"
        end
    end,
}
