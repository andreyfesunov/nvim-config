return {
    "psjay/blamer.nvim",
    config = function ()
       require("blamer").setup{}

       vim.keymap.set("n", "<leader>gb", ":BlamerToggle<CR>", { desc = "Git Blame" })
    end
}
