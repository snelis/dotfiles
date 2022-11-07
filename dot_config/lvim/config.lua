-- *
-- Settings
-- *

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
vim.opt.cmdheight = 1
vim.opt.relativenumber = true
lvim.colorscheme = "catppuccin"
vim.opt.scrolloff = 10

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

-- extra
lvim.builtin.which_key.mappings["z"] = {
  name = "+Extra",
  d = {
    ":lua require('dapui').toggle()<CR>",
    "Toggle DAP UI",
  },
  f = {
    ":lua require('spectre').open_visual({select_word=true})<CR>",
    "Find & Replace",
  },
  g = {
    ":lua require('spectre').open_file_search({select_word=true})<CR>",
    "Find & Replace in current file",
  },
  s = {
    "<cmd>SymbolsOutline<CR>",
    "Toggle Symbols Outline",
  },
  z = {
    "<cmd>ZenMode<cr>",
    "Toggle Zen Mode",
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
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
-- lvim.transparent_window = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true

lvim.builtin.dap.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.ignored_next_char = [=[$]=]
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
lvim.builtin.nvimtree.setup.view.width = 35
lvim.builtin.nvimtree.setup.open_on_setup = true
lvim.builtin.nvimtree.setup.open_on_setup_file = false
lvim.builtin.nvimtree.setup.actions.open_file.window_picker.enable = false
lvim.builtin.nvimtree.setup.view.mappings.list = {
  { key = "s", action = "vsplit" },
  { key = "i", action = "split" },
  { key = "<C-v>", action = "vsplit" },
  { key = "<C-x>", action = "split" },
}

-- lualine
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.globalstatus = false
lvim.builtin.lualine.sections.lualine_b = { components.filename }
lvim.builtin.lualine.inactive_sections.lualine_b = { components.filename }

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
  { 'towolf/vim-helm' },
  {
    'windwp/nvim-spectre',
  },
  {
    -- a tree like view for symbols
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup {
        height = 20
      }
    end
  },
  { 'folke/zen-mode.nvim' },
  { 'nvim-telescope/telescope-dap.nvim' },
  { 'mfussenegger/nvim-dap-python' },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "**/helm/**/*.yaml" },
  callback = function()
    vim.diagnostic.disable()
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.yaml", "*.json", "*.jsonc" },
  command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

require "dashboard"
require "debuggers.python"
