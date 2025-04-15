vim.cmd('syntax enable')
vim.g.mapleader = ' '
vim.opt.path:append('**')
vim.opt.wildignore:append { '**/venv/*', '**/.git/*', '**/obj/*', '**/bin/*', '**/__pycache__/*', 'tags' }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 5

vim.cmd('filetype plugin on')

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.api.nvim_set_keymap('n', '<Leader><Esc>', ':nohlsearch<CR>', { noremap = true })
vim.opt.grepprg = 'git grep -n'

-- UI
vim.opt.showcmd = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.colorcolumn = '100'

-- Folds
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99

-- TODO: add list characters
vim.opt.list = true
vim.api.nvim_set_keymap('n', '<Leader>l', ':set list!<CR>', { noremap = true })

-- File explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>p', ':find *', { noremap = true })

-- Save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })

-- Movement-- change r for substitute
vim.api.nvim_set_keymap('', 'r', 's', { noremap = true })
vim.api.nvim_set_keymap('n', 'R', 'S', { noremap = true })

-- use s for movement instead of l
vim.api.nvim_set_keymap('', 's', 'l', { noremap = true })

-- Windows
vim.api.nvim_set_keymap('n', '<C-Up>', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>v', ':vsplit <BAR> wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>s', ':split <BAR> wincmd j<CR>', { noremap = true })

-- resize
vim.api.nvim_set_keymap('n', '<S-Up>', ':resize +10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Down>', ':resize -10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '+', ':vertical resize +10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '-', ':vertical resize -10<CR>', { noremap = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<Leader>|', ':vert ba<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Right>', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Left>', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>D', ':bd!<CR>', { noremap = true })

-- Quickfix list
vim.api.nvim_set_keymap('n', '<Leader>co', ':copen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cc', ':cclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cn', ':cnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cp', ':cprevious<CR>', { noremap = true })

-- Tag list
-- `Ctrl + ]` navigate to tag
vim.api.nvim_set_keymap('n', '<Leader>to', ':tselect<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tn', ':tnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tp', ':tprevious<CR>', { noremap = true })

-- Navigate code
-- all references
vim.api.nvim_set_keymap('n', '<Leader>r', 'yiw:vim /\\.<C-r>0[^a-z]\\C/ **/*<CR><C-o>:copen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>R', 'yiw:vim /<C-r>0[^a-z]\\C/ **/*<CR><C-o>:copen<CR>', { noremap = true })

-- Search
function Search()
    local pattern = vim.fn.input("Search all files: ")
    if pattern == "" then
        return
    end

    local cmd = string.format("vimgrep /%s/ **/*", pattern)
    local success, _ = pcall(vim.api.nvim_command, cmd)
    if success then
        -- Go back to file
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), "n", true)

        -- wait for feedkeys to finish
        vim.schedule(function()
            vim.cmd("copen")
        end)
    else
        print("Not found")
    end
end
vim.api.nvim_set_keymap('n', '<C-f>', ':lua Search()<CR>', { noremap = true, silent = true })

-- Terminal
vim.api.nvim_set_keymap('t', '<C-\\>', '<C-\\><C-n>', { noremap = true })
if vim.fn.has('win32') == 1 then
  vim.opt.shell = 'pwsh'
end

-- Surround function
function Surround()
    local char = vim.fn.nr2char(vim.fn.getchar())
    local char2 = char:gsub('%(', ')')
                    :gsub('%[', ']')
                    :gsub('%{', '}')
                    :gsub('<', '>')
    local sub_cmd = ':s/\\%V\\(.*\\%V.\\)/' .. char .. '\\1' .. char2
    vim.cmd(sub_cmd)
    vim.cmd('normal! n')
    vim.cmd('nohlsearch')
end
vim.api.nvim_set_keymap('x', '<leader>s', ':<C-u>lua Surround()<CR>', { noremap = true, silent = true })

function SurroundLines()
    local char = vim.fn.nr2char(vim.fn.getchar())
    local char2 = char:gsub('%(', ')')
                    :gsub('%[', ']')
                    :gsub('%{', '}')
                    :gsub('<', '>')
    local sub_cmd = ":'<,'>s/\\(.*\\)/" .. char .. "\\1" .. char2
    vim.cmd(sub_cmd)
    vim.cmd('nohlsearch')
end
vim.api.nvim_set_keymap('x', '<leader>S', ':<C-u>lua SurroundLines()<CR>', { noremap = true, silent = true })

-- add at the end of the line
vim.api.nvim_set_keymap('x', '<Leader>i', ':norm I', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<Leader>a', ':norm A', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'yw', 'yiw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-y>', 'y$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>w', ':set wrap!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>n', ':enew<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>B', ':windo set scrollbind!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'p', 'gp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', 'gP', { noremap = true, silent = true })

-- suppress visual mode
vim.api.nvim_set_keymap('', 'Q', '<nop>', { noremap = true, silent = true })

-- reselect after indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
end

-- vim.opt.background = 'light'
vim.cmd('colorscheme afterglow')
-- vim.cmd('colorscheme Atelier_ForestLight')
-- vim.cmd('colorscheme Atelier_CaveDark')
-- vim.cmd('colorscheme vim-material')


-- avoid freezing the vim process forever, see
-- https://github.com/neovim/neovim/issues/6660
if vim.fn.has('win32') == 1 then
    vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', { noremap = true })
end


-- Refresh nvim config
function _G.Refresh()
    vim.cmd('source ' .. os.getenv('MYVIMRC'))
end
vim.api.nvim_create_user_command('Refresh', _G.Refresh, {})


require('packer_startup')
require('plugins')

