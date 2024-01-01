return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						themes.get_dropdown(),
						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- Enable telescope fzf-native, if installed.
			pcall(telescope.load_extension, "fzf")
			-- Enable telescope ui-select, if installed.
			pcall(telescope.load_extension, "ui-select")

			-- local function fuzzy_search()
			-- 	builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
			-- end

			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Open file finder preview window" })
			vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Open live grep preview window" })
			vim.keymap.set("n", "<Leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			vim.keymap.set("n", "<Leader><Space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			vim.keymap.set(
				"n",
				"<Leader>/",
				builtin.current_buffer_fuzzy_find,
				{ desc = "[/] Fuzzily search in current buffer" }
			)
			vim.keymap.set("n", "<Leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
			vim.keymap.set("n", "<Leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<Leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<Leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<Leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<Leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<Leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		end,
		opts = {},
	},
}
