# vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  {
    "ianklapouch/wildberries.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme wildberries]])
    end,
  },
  {
    "andweeb/presence.nvim",
    config = function()
	require("presence").setup({
		auto_update = true,
		neovim_image_text = "The One True Text Editor",
		main_image = "neovim",
		enable_line_number = true,
		editing_text = "Editing %s",
		workspace_text = "Working on %s",
	})
    end,
  }
})
