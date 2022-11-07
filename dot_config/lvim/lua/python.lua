lvim.lsp.diagnostics.virtual_text = { prefix = "!" }

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", extra_args = { "--skip-string-normalization" }, filetypes = { "python" } },
  { command = "isort", extra_args = { "--profile", "black" }, filetypes = { "python" } },
  { command = "prettier", extra_args = { "--print-with", "100" },
    filetypes = { "yaml", "typescript", "typescriptreact" }, },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
}
