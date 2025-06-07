return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("angular.json", "project.json")(fname)
          end,
        },
      },
    },
  },
}
