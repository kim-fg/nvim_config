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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    -- colorscheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
})

vim.cmd.colorscheme "catppuccin-mocha"

require("mason").setup()
require("mason-lspconfig").setup()

local omnisharp_bin = "C:/Users/joakim.linna/dev/_lsp/omniSharp/OmniSharp.exe"
require("lspconfig").omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) }
    -- Additional configuration can be added here
}