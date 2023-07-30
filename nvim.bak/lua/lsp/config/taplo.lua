return {
  on_setup = function(server)
    server.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        require("key-bindings").mapLSP(buf_set_keymap)
        vim.cmd("autocmd BufWritePre <buffer> Format")
      end,
    })
  end,
}
