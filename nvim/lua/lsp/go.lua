require 'lspconfig'.gopls.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    require('key-bindings').mapLSP(buf_set_keymap)
    vim.cmd('autocmd BufWritePre <buffer> Format')
  end,
}
