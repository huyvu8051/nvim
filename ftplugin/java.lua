local jdtls = require 'jdtls'

local lombok_path = vim.fn.system('ls ~/.m2/repository/org/projectlombok/lombok/*/lombok-*.jar | tail -n 1'):gsub('\n', '')

local mason = vim.fn.stdpath 'data' .. '/mason/packages'
local bundles = {
  vim.fn.glob(mason .. '/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(mason .. '/java-test/extension/server/*.jar'), '\n'))

local config = {
  cmd = { 'jdtls', '--jvm-arg=' .. string.format('-javaagent:%s', vim.fn.expand(lombok_path)) },
  root_dir = require('jdtls.setup').find_root { 'pom.xml', 'gradlew', '.git' },
  init_options = {
    bundles = bundles,
  },
}

jdtls.start_or_attach(config)
-- enable debugger
require('jdtls').setup_dap {
  hotcodereplace = 'auto',
}
