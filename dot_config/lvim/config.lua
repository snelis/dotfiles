-- *
-- Settings
-- *

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
vim.opt.cmdheight = 1
vim.opt.relativenumber = true
lvim.colorscheme = "catppuccin"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

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

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- lvim.keys.normal_mode["<F6>"] = "<cmd>let &background=(&background=='light'?'dark':'light') <cr>"

local toggle_theme = function()
  if vim.g.catppuccin_flavour == 'mocha' then
    vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
  else
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  end
  vim.api.nvim_command "colorscheme catppuccin"
end

lvim.builtin.which_key.mappings["tt"] = {
  function() toggle_theme() end, "toggle theme"
}
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
-- lvim.transparent_window = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.open_on_setup = true
lvim.builtin.nvimtree.setup.open_on_setup_file = false
lvim.builtin.nvimtree.setup.actions.open_file.window_picker.enable = false
lvim.builtin.nvimtree.setup.view.mappings.list = {
  { key = "s", action = "vsplit" },
  { key = "i", action = "split" },
  { key = "<C-v>", action = "vsplit" },
  { key = "<C-x>", action = "split" },
}


-- line numbers
lvim.builtin.which_key.mappings["n"] = {
  "<cmd> set nu! <CR>", "toggle line number"
}
lvim.keys.normal_mode["<leader>rn"] = "<cmd> set rnu! <CR>"
lvim.keys.normal_mode["<C-s>"] = "<cmd> w <CR>"

-- Visual mode
lvim.keys.normal_mode["F"] = "<cmd> :NvimTreeFindFile <CR>"
lvim.keys.visual_mode["p"] = 'p:let @+=@0<CR>:let @"=@0<CR>'


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {
--   python = {
--     pythonPath = "/home/snelis/.pyenv/shims/python",
--     venvPath = "/home/snelis/.pyenv/versions/",
--   },
-- } -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end

--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

local pypath = "/home/snelis/.pyenv/versions/snelis/bin/"
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


-- local cmp = require "cmp"
-- cmp.setup {
--   sources = {
--     {
--       name = "rg"
--     }
--   }
-- }
table.insert(lvim.builtin.cmp.sources, { name = "rg" })

-- catppuccin
vim.g.catppuccin_flavour = "mocha"

-- Additional Plugins
lvim.plugins = {
  { 'LunarVim/Colorschemes' },
  { "tiagovla/tokyodark.nvim" },
  { "tpope/vim-surround" },
  { 'christoomey/vim-tmux-navigator' },
  { 'catppuccin/nvim' },
  { 'lukas-reineke/cmp-rg' },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
