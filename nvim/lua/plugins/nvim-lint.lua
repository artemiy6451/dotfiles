require('lint').linters_by_ft = {
  markdown = {'vale',},
  python = {'ruff'}
}

vim.api.nvim_create_autocmd({ "TextChanged", "BufWritePost", "BufRead"}, {
  callback = function()
    require("lint").try_lint()
  end,
})
