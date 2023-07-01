local null_ls = require("null-ls")

null_ls.setup({
  sources = { 
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.deno_lint,
    null_ls.builtins.diagnostics.commitlint,
    null_ls.builtins.diagnostics.clang_check,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.ltrs,
    null_ls.builtins.diagnostics.checkstyle.with({
      extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
    }),
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.code_actions.ltrs,
    null_ls.builtins.code_actions.xo,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.clang_format
  },
})
