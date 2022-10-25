local pypath = "~/.pyenv/versions/snelis/bin/"
vim.g.python3_host_prog = pypath .. "python"

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

pcall(function() require("dap-python").setup(pypath .. "python") end)
local dap = require "dap"

dap.adapters.debugpy = {
  type = "server",
  host = "localhost",
  port = 1337
}

dap.adapters.foobar = {
  type = "executable",
  command = "docker-compose",
  args = {
    "run", "--rm", "--service-ports", "test", "--", "python", "-m", "debugpy.adapter"
  }
}

table.insert(dap.configurations.python, {
  name = "foobar",
  type = "foobar",
  request = "launch",
  cwd = "/app",
  pathMappings = {
    {
      localRoot = vim.fn.getcwd(),
      remoteRoot = "/app",
    }
  },
  program = function()
    return "/app/${relativeFile}"
  end,
  pythonPath = "/usr/local/bin/python",
  -- python = "pytest"
})

table.insert(dap.configurations.python, {
  type = "debugpy",
  request = "attach",
  connect = {
    host = "localhost",
    port = 1337
  },
  cwd = vim.fn.getcwd(),
  preLaunchTask = "docker-compose run --rm --service-ports test -- python -m debugpy --listen 0.0.0.0:1337 --wait-for-client -m pytest",
  pathMappings = {
    {
      localRoot = vim.fn.getcwd(),
      remoteRoot = "/app",
    }
  },
  name = "Attach to docker",
  program = "${file}",
  -- python = "docker-compose run --rm test -- python"
})
