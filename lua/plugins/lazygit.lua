return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	vim.keymap.set("n", "<Leader>lg", ":LazyGit<CR>", { desc = "Open LazyGit window", silent = true }),
}
