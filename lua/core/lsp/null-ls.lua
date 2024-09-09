local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
    -- diagnostics.flake8
    formatting.stylua,
    diagnostics.eslint_d,
    null_ls.builtins.completion.spell,
    null_ls.builtins.code_actions.gitsigns,
    diagnostics.ansiblelint,
    diagnostics.commitlint,
    diagnostics.dotenv_linter,
    diagnostics.hadolint, -- docker
    diagnostics.jsonlint,
    diagnostics.phpstan, -- Requires a valid phpstan.neon at root
    -- diagnostics.php,
    formatting.blade_formatter,
    diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
    diagnostics.stylelint, -- scss, less, css, sass
    diagnostics.zsh,
    formatting.astyle, -- c, cpp, c#, java
    formatting.beautysh -- bash
	},
})
