vim.g.mapleader = ","
vim.g.maplocalleader = ","

local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true,
}

map("i", "jk", "<ESC>", opt)
map("i", "kk", "<ESC>", opt)
map("i", "jj", "<ESC>", opt)

map("n", "H", ":BufferLineCyclePrev<CR>", opt)
map("n", "L", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-H>", ":BufferLineMovePrev<CR>", opt)
map("n", "<C-L>", ":BufferLineMoveNext<CR>", opt)

map("n", "<Tab>", "%", opt)

map("n", "<leader>v", ":NvimTreeFindFile<CR>", opt)
map("n", "<leader>w", ":NvimTreeToggle<CR>", opt)

map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)

map("n", "<C-a>", "<C-w>>", opt)
map("n", "<C-d>", "<C-w><", opt)

-- easymotion
map("n", "<leader>e", ":HopChar2<CR>", opt)
map("n", "<leader>tr", ":TranslateW<CR>", opt)
map("v", "<leader>tr", ":TranslateW<CR>", opt)

-- find
map("n", "<leader>fp", ":Telescope live_grep<CR>", opt)


local pluginKeys = {}

-- maplsp
pluginKeys.mapLSP = function(mapbuf)
  mapbuf("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --rename
  mapbuf("n", "<leader>re", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", ":Telescope lsp_definitions<CR>", opt)
  mapbuf("n", "<leader>fu", ":Telescope lsp_references<CR>", opt)
  mapbuf("n", "<leader>gf", ":Telescope find_files<CR>", opt)
  mapbuf("n", "<leader>gi", ":Telescope lsp_implementations<CR>", opt)
  mapbuf("n", "<leader>sp", ":SymbolsOutline<CR>", opt)
  mapbuf("n", "<leader>ic", ":Telescope lsp_incoming_calls<CR>", opt)
  mapbuf("n", "<leader>oc", ":Telescope lsp_outgoing_calls<CR>", opt)
  -- diagnostic
  mapbuf("n", "go", ":Telescope diagnostics<CR>", opt)
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>ff", ":lua vim.lsp.buf.format()<CR>", opt)
  -- code action
  mapbuf("i", "<ctrl><space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  mapbuf("n", "<leader>l", ":CodeActionMenu<CR>", opt)
end

pluginKeys.rustMapLSP = function(mapbuf)
  mapbuf("n", "<leader>rr", ":RustRun<CR>", opt)
  mapbuf("n", "<leader>rb", ":RustBuild<CR>", opt)
end

-- comment
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}

-- typescript
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
  mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
  mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  -- map("n", "<leader>gj", function()
  --   if vim.wo.diff then
  --     return "]c"
  --   end
  --   vim.schedule(function()
  --     gs.next_hunk()
  --   end)
  --   return "<Ignore>"
  -- end, { expr = true })
  --
  -- map("n", "<leader>gk", function()
  --   if vim.wo.diff then
  --     return "[c"
  --   end
  --   vim.schedule(function()
  --     gs.prev_hunk()
  --   end)
  --   return "<Ignore>"
  -- end, { expr = true })

  -- map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
  -- map("n", "<leader>gS", gs.stage_buffer)
  -- map("n", "<leader>gu", gs.undo_stage_hunk)
  -- map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
  -- map("n", "<leader>gR", gs.reset_buffer)
  -- map("n", "<leader>gp", gs.preview_hunk)
  -- map("n", "<leader>gb", function() gs.blame_line({ full = true }) end)
  -- map("n", "<leader>gd", gs.diffthis)
  -- map("n", "<leader>gD", function() gs.diffthis("~") end)
  -- -- toggle
  -- map("n", "<leader>gtd", gs.toggle_deleted)
  -- map("n", "<leader>gtb", gs.toggle_current_line_blame)
  -- Text object
  -- map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

-- nvim-cmp
pluginKeys.cmp = function(cmp)
  return {
    ["<C-j>"] = cmp.mapping.scroll_docs(4),
    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<esc>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
      else
        cmp.complete()
      end
    end, { "i", "s", "c" }),
  }
end

-- nvim-dap
pluginKeys.mapDAP = function()
  -- 开始
  map("n", "<leader>dd", ":RustDebuggables<CR>", opt)
  -- 结束
  map(
    "n",
    "<leader>de",
    ":lua require'dap'.close()<CR>"
      .. ":lua require'dap'.terminate()<CR>"
      .. ":lua require'dap.repl'.close()<CR>"
      .. ":lua require'dapui'.close()<CR>"
      .. ":lua require('dap').clear_breakpoints()<CR>"
      .. "<C-w>o<CR>",
    opt
  )
  -- 继续
  map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opt)
  -- 设置断点
  map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
  map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
  --  stepOver, stepOut, stepInto
  map("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opt)
  map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", opt)
  map("n", "<leader>dl", ":lua require'dap'.step_into()<CR>", opt)
  -- 弹窗
  map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
end

return pluginKeys
