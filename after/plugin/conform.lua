require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		cs = {},
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
