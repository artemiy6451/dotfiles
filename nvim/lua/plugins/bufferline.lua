vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        buffer_close_icon = '',
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        indicator = {
            icon = '   ',
            style = 'icon'
        },
    }
}
