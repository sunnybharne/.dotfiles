-- Options
vim.g.mapleader = " "  -- Set leader key to space
vim.opt.number = true  -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.cursorline = true  -- Highlight the current line
vim.opt.cursorlineopt = 'line'  -- Highlight only the line
vim.opt.clipboard:append("unnamedplus")  -- Use system clipboard
vim.g.loaded_netrw = 1  -- Disable netrw
vim.g.loaded_netrwPlugin = 1  -- Disable netrwPlugin
vim.opt.termguicolors = true  -- Enable true color support
vim.opt.shiftwidth = 2  -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.smartindent = true  -- Smart indenting
vim.opt.wrap = true  -- Wrap long lines
vim.opt.tabstop = 2  -- Number of spaces that a <Tab> in the file counts for vim.api.nvim_set_hl(0, 'CursorLine', { underline = true, sp = '#ff0000', bg = '#000000' })  -- Bright red underline

-- Key mappings
vim.api.nvim_set_keymap("n", "<Leader>|", ":vsplit<CR>", { noremap = true })  -- Vertical split
vim.api.nvim_set_keymap("n", "<Leader>-", ":hsplit<CR>", { noremap = true })  -- Horizontal split
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })  -- Indent left and reselect
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })  -- Indent right and reselect
vim.api.nvim_set_keymap("v", "<S-j>", ":move '>+1<CR>gv-gv", {noremap = true })  -- Move selected line down
vim.api.nvim_set_keymap("v", "<S-k>", ":move '<-1<CR>gv-gv", {noremap = true })  -- Move selected line up

-- Navigate to next and previous buffers
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true })  -- Next buffer
vim.api.nvim_set_keymap("n", "<leader>bp", ":bprevious<CR>", { noremap = true })  -- Previous buffer

-- Close current buffer
vim.api.nvim_set_keymap("n", "<leader>bk", ":bd<CR>", { noremap = true })  -- Close buffer

-- Keymap to open Copilot Chat
vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChat<CR>", { noremap = true })  -- Open Copilot Chat

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>pp", ":Telescope neovim-project discover<CR>", { noremap = true })  -- Open Telescope project discover

-- Todo Comments
vim.api.nvim_set_keymap("n", "<leader>fd", ":TodoTelescope<CR>", { noremap = true })  -- Open Telescope todo comments

-- Autocommand for Bicep files
vim.api.nvim_exec([[
  augroup bicep
    autocmd!
    autocmd FileType bicep setlocal commentstring=//\ %s  -- Set comment string for Bicep files
  augroup END
]], false)

-- Installing lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)  -- Prepend lazy.nvim to runtime path

require("lazy").setup("plugins")  -- Setup lazy.nvim with plugins
