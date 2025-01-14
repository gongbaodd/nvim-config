local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

null_ls.setup {
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
        augroup END
      ]])
    end
  end,
  debug = true,
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish
  },
}
