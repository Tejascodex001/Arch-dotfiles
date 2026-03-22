-- ── Bootstrap lazy.nvim ──────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- ── Core settings ─────────────────────────────────────────
vim.opt.number = true          -- line numbers
vim.opt.relativenumber = true  -- relative numbers (great for jumping)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false           -- no line wrap
vim.opt.hlsearch = false       -- don't highlight after search
vim.opt.incsearch = true
vim.opt.scrolloff = 8          -- keep 8 lines above/below cursor
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"  -- system clipboard

-- ── Leader key (Space) ────────────────────────────────────
vim.g.mapleader = " "

-- ── Keymaps ───────────────────────────────────────────────
local map = vim.keymap.set

-- Save and quit
map("n", "<leader>w", ":w<CR>",  { desc = "Save" })
map("n", "<leader>q", ":q<CR>",  { desc = "Quit" })
map("n", "<leader>x", ":x<CR>",  { desc = "Save and quit" })

-- Move between panes (works with tmux Alt+arrow)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- ── Plugins ───────────────────────────────────────────────
require("lazy").setup({

  -- Colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },

  -- File finder (Ctrl+p to find files)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>" },
      { "<leader>g", "<cmd>Telescope live_grep<cr>" },
    },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "cpp", "python", "lua", "bash" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },


  -- LSP (code completion, errors, go-to-definition)
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("clangd", {})
      vim.lsp.config("pyright", {})
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"]   = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"]    = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "luasnip" },
        },
      })
    end,
  },

  -- Auto close brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Shows keybind hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },

})
