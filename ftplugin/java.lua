local jdtls = require("jdtls")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

local config = {
  cmd = { "jdtls" },

  root_dir = vim.fs.root(0, {
    ".git",
    "pom.xml",
    "build.gradle",
    "mvnw",
    "gradlew"
  }),

  settings = {
    java = {}
  },

  init_options = {
    bundles = {}
  },
}

jdtls.start_or_attach(config)
