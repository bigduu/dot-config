local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("cmp not found!")
  return
end

-- nvim-cmp
local mapping = function(ncmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  return {
      ["<C-j>"] = ncmp.mapping.scroll_docs(4),
      ["<C-k>"] = ncmp.mapping.scroll_docs( -4),
      ["<C-e>"] = ncmp.mapping.close(),
      ["<C-p>"] = ncmp.mapping.select_prev_item(),
      ["<C-n>"] = ncmp.mapping.select_next_item(),
      ["<esc>"] = ncmp.mapping.abort(),
      ["<C-Space>"] = ncmp.mapping(function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        if ncmp.visible() then
          local entry = ncmp.get_selected_entry()
          if not entry then
            ncmp.select_next_item({ behavior = ncmp.SelectBehavior.Select })
          else
            ncmp.confirm()
          end
        else
          ncmp.complete()
        end
      end, { "i", "s", "c" }),
      ["<CR>"] = ncmp.mapping.confirm({
          behavior = ncmp.ConfirmBehavior.Replace,
          select = true,
      }),
  }
end

cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        -- { name = "cmp_tabnine" },
        -- { name = "vsnip" },
        { name = "spell" },
        -- { name = "look" },
        { name = "crates" },
    }, {
        { name = "buffer" },
        -- { name = "cmp_tabnine" },
    }),
    mapping = mapping(cmp),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.menu = ({
                  copilot = "[Copilot]",
                  -- cmp_tabnine = "[Tabnine]",
                  nvim_lsp_signature_help = "[LSP_S]",
                  -- vsnip = "[Vsnip]",
                  nvim_lsp = "[LSP]",
                  buffer = "[Buffer]",
                  path = "[Path]",
                  spell = "[Spell]",
                  look = "[Look]",
              })[entry.source.name]
          return vim_item
        end,
    },
})
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
    }),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = "cmdline" },
    }, {
        { name = "path" },
    }),
})
