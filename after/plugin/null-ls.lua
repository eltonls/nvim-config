local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.djhtml,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.rustywind,
    },
})
