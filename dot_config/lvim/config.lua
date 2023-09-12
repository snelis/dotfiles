--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin"
lvim.colorscheme_toggle = { "light", "dark" }

-- lvim.keys.normal_mode["<F5>"] = "<cmd>let &background='light'<cr>"
-- lvim.keys.normal_mode["<F6>"] = "<cmd>let &background='dark'<cr>"
lvim.keys.normal_mode["<F7>"] = "<cmd>source ~/.vimrc_background<cr>"
-- lvim.keys.normal_mode["<F6>"] = "<cmd>let &background=(&background=='light'?'dark':'light') <cr>"

-- ctrl-s to save
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Tabs
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"

-- Decleration in split
lvim.keys.normal_mode["gv"] = ":vsplit | lua vim.lsp.buf.definition()<CR>"
lvim.keys.normal_mode["gx"] = ":split | lua vim.lsp.buf.definition()<CR>"

-- Relative line numbers
lvim.keys.normal_mode["<leader>rn"] = "<cmd> set rnu! <CR>"
lvim.builtin.which_key.mappings["n"] = { "<cmd> set nu! <CR>", "toggle line number" }

-- Find file in tree
lvim.keys.normal_mode["F"] = "<cmd> :NvimTreeFindFile <CR>"
lvim.keys.visual_mode["p"] = 'p:let @+=@0<CR>:let @"=@0<CR>'

-- Floating terminal
lvim.builtin.terminal.open_mapping = "<C-x>"

-- dark & light
lvim.keys.normal_mode["<F5>"] = "<cmd>let &background='light'<cr>"
lvim.keys.normal_mode["<F6>"] = "<cmd>let &background='dark'<cr>"

-- lualine
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.globalstatus = false
lvim.builtin.lualine.sections.lualine_b = { components.filename }
lvim.builtin.lualine.inactive_sections.lualine_b = { components.filename }

-- NvimTree
-- lvim.builtin.nvimtree.setup.actions.change_dir.enable = false
lvim.builtin.nvimtree.setup.actions.open_file.window_picker.enable = false
lvim.builtin.nvimtree.setup.view.mappings = {
  list = {
    { key = "s",     action = "vsplit" },
    { key = "i",     action = "split" },
    { key = "<C-v>", action = "vsplit" },
    { key = "<C-x>", action = "split" }
  }
}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = open_nvim_tree
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.yaml" },
  callback = function()
    if vim.bo.filetype == "helm" then
      vim.diagnostic.disable()
    end
  end
})


lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle<cr>", "Toggle" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- -- Enable searching for strings in the project
-- vim.list_extend(lvim.builtin.cmp.sources, {
--   { name = "rg" },
-- })


lvim.lsp.automatic_configuration.skipped_servers = {
  "angularls",
  "ansiblels",
  "antlersls",
  "azure_pipelines_ls",
  "ccls",
  "custom_elements_ls",
  "omnisharp",
  "cssmodules_ls",
  "denols",
  "docker_compose_language_service",
  "ember",
  "emmet_ls",
  "eslint",
  "eslintls",
  "glint",
  "golangci_lint_ls",
  "gradle_ls",
  "graphql",
  "java_language_server",
  "jedi_language_server",
  "ltex",
  "neocmake",
  "ocamlls",
  "phpactor",
  "psalm",
  "pylsp",
  "pylyzer",
  "pyre",
  "quick_lint_js",
  "reason_ls",
  "rnix",
  "rome",
  "ruby_ls",
  "ruff_lsp",
  "scry",
  "solang",
  "solc",
  "solidity_ls",
  "solidity_ls_nomicfoundation",
  "sorbet",
  "sourcekit",
  "sourcery",
  "spectral",
  "sqlls",
  "sqls",
  "standardrb",
  "stylelint_lsp",
  "svlangserver",
  "tflint",
  "unocss",
  "verible",
  "vtsls",
  "vuels",
}
-- Formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- Additional Plugins
lvim.plugins = {
  { 'catppuccin/nvim' },
  -- { 'lukas-reineke/cmp-rg' },
  { 'christoomey/vim-tmux-navigator' },
  { 'tpope/vim-surround' },
  { 'szw/vim-maximizer' },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { 'towolf/vim-helm' },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').set_default_keymaps()
    end
  },
}

-- -- Enable copilot
-- table.insert(lvim.plugins, {
--   "zbirenbaum/copilot-cmp",
--   event = "InsertEnter",
--   dependencies = { "zbirenbaum/copilot.lua" },
--   config = function()
--     vim.defer_fn(function()
--       require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
--       require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
--     end, 100)
--   end,
-- })
