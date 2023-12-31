local servers = {
	bashls = {},
	clangd = {},
	cssls = {},
	dockerls = {},
	emmet_language_server = {},
	eslint = {},
	gopls = {},
	html = {},
	jsonls = {},
	lua_ls = {},
	marksman = {},
	nil_ls = {},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
		opts = {
			ensure_installed = vim.tbl_keys(servers),
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local function setup_server(server_name)
				if lspconfig[server_name] then
					lspconfig[server_name].setup({ capabilities = capabilities })
				end
			end

			for server_name in pairs(servers) do
				setup_server(server_name)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, {})
		end,
		opts = {},
	},
}
