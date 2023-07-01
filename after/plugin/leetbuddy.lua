require("leetbuddy").setup({
  language = "ts",
})

vim.keymap.set("n", "<leader>bq", "<cmd>LBQuestions<cr>")
vim.keymap.set("n", "<leader>bb", "<cmd>LBQuestion<cr>")
vim.keymap.set("n", "<leader>br", "<cmd>LBReset<cr>")
vim.keymap.set("n", "<leader>bt", "<cmd>LBTest<cr>")
vim.keymap.set("n", "<leader>bs", "<cmd>LBSubmit<cr>")
