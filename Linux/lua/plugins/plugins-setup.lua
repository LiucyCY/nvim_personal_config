local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  -- 这里写插件地址
  use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'jiangmiao/auto-pairs'}
  use {'vim-airline/vim-airline'}
  use {'nvim-tree/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'mfussenegger/nvim-dap'}
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use {'theHamsta/nvim-dap-virtual-text'}
  -- use({"iamcco/markdown-preview.nvim",run = function() vim.fn["mkdp#util#install"]() end,})
  if packer_bootstrap then
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
    require('packer').sync()
  end
end)
