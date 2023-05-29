local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options

require("lazy").setup({
  "folke/which-key.nvim",
  {"folke/neoconf.nvim", cmd = "Neoconf" },
  {"folke/neodev.nvim"},
  {'projekt0n/github-nvim-theme', tag = 'v0.0.7' },
  {'neoclide/coc.nvim', branch = 'release'},
  {'jiangmiao/auto-pairs', lazy=true},
  {'vim-airline/vim-airline'},
  {'nvim-tree/nvim-tree.lua'},
  {'mfussenegger/nvim-dap', lazy = true},
  {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}, lazy = true },
  {'theHamsta/nvim-dap-virtual-text', lazy=true},
  {"iamcco/markdown-preview.nvim",run = function() vim.fn["mkdp#util#install"]() end, lazy = true},
  {"catppuccin/nvim", as = "catppuccin", lazy = true },
  {'shaunsingh/nord.nvim', lazy=true},
  {"rebelot/kanagawa.nvim", lazy=true},
  {'nvim-telescope/telescope.nvim', tag = '0.1.1', lazy = true},
  {"nvim-lua/plenary.nvim", lazy = true},
  {"Mofiqul/vscode.nvim", lazy=true},
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy=true},
  {"p00f/nvim-ts-rainbow", lazy=true},
  {'kyazdani42/nvim-web-devicons', lazy=true},
  {"CRAG666/code_runner.nvim", config = true, lazy=true}
})
