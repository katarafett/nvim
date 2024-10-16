local map = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

local full_map = function(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
    map("v", lhs, rhs, opts)
    map("o", lhs, rhs, opts)
end

-- File navigation
map('n', '<leader>jj', function() require('telescope.builtin').find_files() end)
map('n', '<leader>jd', function() require('telescope.builtin').live_grep() end)
map('n', '<leader>ja', '<cmd>NvimTreeToggle<cr>')

map("n", "<BS>", "<cmd>b#<cr>")

map('n', '<leader>a', function() require("harpoon.mark").add_file() end)
map('n', '<leader>e', function() require("harpoon.ui").toggle_quick_menu() end)
map('n', '<c-a>', function() require("harpoon.ui").nav_file(1) end)
map('n', '<c-s>', function() require("harpoon.ui").nav_file(2) end)
map('n', '<c-d>', function() require("harpoon.ui").nav_file(3) end)
map('n', '<c-f>', function() require("harpoon.ui").nav_file(4) end)

map('n', '<leader>o', '<cmd>Outline<cr>')

map('n', '<c-d>', '<c-d>zz')
map('n', '<c-u>', '<c-u>zz')
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Actions
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '>-2<CR>gv=gv")
map("n", "J", "mzJ`z")
map("x", "<leader>p", "\"dP")
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<CR>", "<cmd>nohls<CR>")

-- LSP Junk
map("n", "<leader>f", function() vim.lsp.buf.format({ 4, true, true, false, true }) end)

vim.keymap.set('n', 'gd', function() require('goto-preview').goto_preview_definition() end)
vim.keymap.set('n', 'gt', function() require('goto-preview').goto_preview_type_definition() end)
vim.keymap.set('n', 'gi', function() require('goto-preview').goto_preview_implementation() end)
vim.keymap.set('n', 'gD', function() require('goto-preview').goto_preview_declaration() end)
vim.keymap.set('n', 'gr', function() require('goto-preview').goto_preview_references() end)
vim.keymap.set('n', 'gp', function() require('goto-preview').close_all_win() end)

vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
vim.keymap.set('n', 'gtd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
vim.keymap.set('n', 'gtD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
vim.keymap.set('n', 'gti', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
vim.keymap.set('n', 'gto', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
vim.keymap.set('n', 'gtr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
vim.keymap.set('n', 'gts', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

-- DAP
map("n", "<localleader>l", function() require('dap').step_into() end)
map("n", "<localleader>o", function() require('dap').step_over() end)
map("n", "<localleader>t", function() require('dap').toggle_breakpoint() end)
map("n", "<localleader>d", function() require('dapui').toggle() end)

-- Window resizing
vim.keymap.set("n", "<Right>", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "<Left>", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "<Down>", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "<Up>", [[<cmd>horizontal resize -2<cr>]])

-- Open config
map('n', '<leader>rc', '<cmd>vs ~/.config/nvim<cr>')

-- Formatting
local is_wrapping = false
local is_line_wrapping = false
map('n', '<leader>ww', function()
    is_wrapping = not is_wrapping
    vim.opt.wrap = is_wrapping
end)
map('n', '<leader>wl', function()
    is_line_wrapping = not is_line_wrapping
    vim.opt.linebreak = is_line_wrapping
end)

-- Misc
map('n', '<leader>vk', function() require('telescope.builtin').colorscheme() end)
