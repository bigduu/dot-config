local lspconfig_opts = {
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- 绑定快捷键
    require("key-bindings").mapLSP(buf_set_keymap)
    local rt = require("rust-tools")
    vim.keymap.set("n", "<Leader>r", rt.hover_actions.hover_actions, { buffer = bufnr })
  end,
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      procMacro = {
        enable = true,
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      lens = {
        enable = true,
        references = {
          adt = {
            enable = true,
          },
        },
      },
      -- enable clippy on save
      checkOnSave = {
        command = "clippy",
      },
      typing = {
        autoClosingAngleBrackets = {
          enable = true,
        },
      },
      inlayHints = {
        maxLength = 99999,
        minLines = 0,
        bindingModeHints = {
          enable = true,
        },
        closureReturnTypeHints = {
          enable = true,
        },
        expressionAdjustmentHints = {
          enable = true,
        },
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true,
        },
      },
      lru = {
        capacity = 99999,
      },
      workspace = {
        symbol = {
          search = {
            limit = 99999,
          },
        },
      },
      diagnostics = {
        experimental = {
          enable = true,
        },
      },
    },
  },
}

return {
  on_setup = function(server)
    local ok_rt, rust_tools = pcall(require, "rust-tools")
    if not ok_rt then
      print("Failed to load rust tools, will set up `rust_analyzer` without `rust-tools`.")
      server.setup(lspconfig_opts)
    else
      -- We don't want to call lspconfig.rust_analyzer.setup() when using rust-tools
      rust_tools.setup({
        server = lspconfig_opts,
        dap = require("dap.nvim-dap.rust"),
      })
    end
  end,
}
