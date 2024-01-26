vim.g.mapleader = " "					-- sets leader key
vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw
vim.opt.title = true					-- show title
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false				-- turn off vi compatibility mode
vim.opt.number = true					-- turn on line numbers
vim.opt.relativenumber = true			-- turn on relative line numbers
vim.opt.mouse = 'a'						-- enable the mouse in all modes
vim.opt.ignorecase = true				-- enable case insensitive searching
vim.opt.smartcase = true				-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false				-- disable all highlighted search results
vim.opt.incsearch = true				-- enable incremental searching
vim.opt.wrap = true						-- enable text wrapping
vim.opt.tabstop = 4						-- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8"			-- encoding set to utf-8
vim.opt.pumheight = 10					-- number of items in popup menu
vim.opt.showtabline = 2					-- always show the tab line
vim.opt.laststatus = 2					-- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false				-- expand tab 
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.showmode = true
vim.opt.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = "monospace:h17"
vim.opt.clipboard = unnamedplus
vim.opt.completeopt= { "menuone", "noselect" }
vim.opt.splitbelow = true				-- split go below
vim.opt.splitright = true				-- vertical split to the right
vim.opt.termguicolors = true			-- terminal gui colors
vim.opt.history= 500
vim.cmd('colorscheme desert')			-- set colorscheme
vim.cmd('filetype plugin on')			-- set filetype 
vim.cmd('filetype indent on')           -- set indent 
vim.cmd('set wildmenu')					-- enable wildmenu
vim.cmd('set cursorline')               -- highlight current line
vim.cmd('set autoread')                 -- set auto update current file
vim.cmd('set lazyredraw')               -- Don't redraw while executing macros (good performance config)
vim.cmd('set path+=**')					-- search current directory recursively
vim.cmd('set magic')
vim.cmd('set smarttab')

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
map("n", "<leader>rl", ":source ~/.config/nvim/init.lua<CR>")	-- reload neovim config

-- Open netrw in 25% split in tree view
map("n", "<leader>l", ":25Lex<CR>")					-- space+e toggles netrw tree view

-- Tab bindings 
map("n", "<leader>tc", ":tabnew<CR>")				-- space+tc creates new tab
map("n", "<leader>tx", ":tabclose<CR>")				-- space+tx closes current tab
map("n", "<leader>tp", ":tabprevious<CR>")			-- space+tp to previous tab
map("n", "<leader>tn", ":tabnext<CR>")				-- space+tn to next tab
map("n", "<leader>t-", ":-tabmove<CR>")             -- space+t- move to lef tab
map("n", "<leader>t+", ":+tabmove<CR>")             -- space+t+ move to right tab
map("n", "<leader>t0", ":0tabmove<CR>")             -- space+t0 move to first tab
map("n", "<leader>t$", ":$tabmove<CR>")             -- space+t$ move to last tab 
map("n", "<leader>t#", ":#tabmove<CR>")             -- space+t# move to the recent tab after
map("n", "<leader>to", ":tabonly<CR>")              -- space+t0 close other tabs

-- easy split generation
map("n", "<leader>vs", ":vsplit<CR>")				-- space+vs creates a veritcal split
map("n", "<leader>hs", ":split<CR>")				-- space+hs creates a horizontal split

-- easy split navigation
map("n", "<C-h>", "<C-w>h")						-- leader+w switches to left split
map("n", "<C-l>", "<C-w>l")						-- leader+e switches to right split
map("n", "<C-j>", "<C-w>j")						-- leader+d switches to bottom split
map("n", "<C-k>", "<C-w>k")						-- leader+u switches to top split

-- adjust split sizes easier
map("n", "<leader>vl", ":vertical resize +3<CR>")		-- leader+vl resizes vertical split +
map("n", "<leader>vr", ":vertical resize -3<CR>")		-- leader+vr resizes vertical split -

-- buffer navigation
map("n", "<leader>bn", ":bnext <CR>")					-- Space+bn goes to next buffer
map("n", "<leader>bp", ":bprevious <CR>")				-- Space+bp goes to previous buffer
map("n", "<leader>bd", ":bd! <CR>")						-- Space+bd delets current buffer
map("n", "<leader>ba", ":bufdo bd <CR>")                -- Space+ba Close all the buffers

--fast saving
map("n","<leader>w", ":w!<CR>")

-- Visual Maps
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")	-- Replace all instances of highlighted words 
map("v", "∆", ":m '>+1<CR>gv=gv")						-- alt+j Move current line down in visual mode
map("v", "˚", ":m '>-2<CR>gv=gv")						-- alt+k Move current line up in visual mode
map("n", "∆",  "mz:m+<cr>`z")                           -- alt+j Move current line down in normal mode
map("",  "˚",  "mz:m-2<cr>`z")                          -- alt+k Move current line up in normal mode

-- Popup menu
map("i", "<C-p>", "<C-n>")								-- select autocomplete popup menu

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")

-- Automatically creates templates
-- if template
map("n", "<leader>i", "iif [ @ ]; then <CR><CR> else <CR><CR> fi <ESC>/@ <CR>")

-- html template
map("n", "<leader>ht", "i<!DOCTYPE html><CR>	<html lang=\"en\"><CR>	<head><CR>	<meta charset=\"UTF-8\"><CR></head><CR> @ </html><ESC>/@ <CR>")
