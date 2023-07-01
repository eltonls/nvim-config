require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              home = "~/notes/home"
            }
          }
        }
    }
}
