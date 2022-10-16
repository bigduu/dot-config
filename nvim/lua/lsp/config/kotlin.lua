return {
	on_setup = function(server)
		server.setup({
			on_attach = function(client, bufnr)
				-- 禁用格式化功能，交给专门插件插件处理
				client.server_capabilities.document_formatting = false
				client.server_capabilities.document_range_formatting = false
				-- 绑定快捷键
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				require("key-bindings").mapLSP(buf_set_keymap)
			end,
		})
	end,
}
