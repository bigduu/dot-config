require 'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = '/opt/homebrew/bin/lua',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
        require"lsp-format".on_attach(client)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('key-bindings').mapLSP(buf_set_keymap)
        vim.cmd('autocmd BufWritePre <buffer> Format')
    end,
  code_action= {
    codeActionKinds={"quickefix","source.organizeImports"},
    workDoneProgress=true
  }
}

