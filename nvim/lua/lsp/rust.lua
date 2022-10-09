require 'lspconfig'.rust_analyzer.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    require('key-bindings').rustMapLSP(buf_set_keymap)
    vim.cmd('autocmd BufWritePre <buffer> Format')
  end,
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  settings = {
    ["rust_analyzer"] = {
      imports = {
        granularity = {
          group = "module"
        },
        prefix = "self"
      },
      cargo = {
        buildScripts = {
          enable = true
        },
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
      checkOnSave = {
        command = "clippy"
      }
    }
  }
}
