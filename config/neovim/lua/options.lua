vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'


-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
-- UI
vim.opt.number = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showmatch = true

vim.opt.spell = true
vim.opt.spelllang = 'en_us'

vim.lsp.config.rust_analyzer = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' }
}

vim.lsp.config.bashls = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
}

vim.lsp.config.pylsp = {
    cmd = { 'pylsp' },
    filetypes = { 'python' }
}

vim.lsp.enable 'rust_analyzer'
vim.lsp.enable 'bashls'
vim.lsp.enable 'pylsp'

