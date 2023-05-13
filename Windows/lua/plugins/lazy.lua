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
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {'projekt0n/github-nvim-theme', tag = 'v0.0.7' },
  {'neoclide/coc.nvim', branch = 'release'},
  {'jiangmiao/auto-pairs'},
  {'vim-airline/vim-airline'},
  {'nvim-tree/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'},
  {'mfussenegger/nvim-dap'},
  {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },
  {'theHamsta/nvim-dap-virtual-text'},
  {"iamcco/markdown-preview.nvim",run = function() vim.fn["mkdp#util#install"]() end,},
  {"catppuccin/nvim", as = "catppuccin" },
  {'shaunsingh/nord.nvim'},
  {"rebelot/kanagawa.nvim"},
  {'nvim-telescope/telescope.nvim', tag = '0.1.1'},
  {"nvim-lua/plenary.nvim"}
})
