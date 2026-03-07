local jdtls = require("jdtls")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

local lombok_path = vim.fn.system(
	"ls ~/.m2/repository/org/projectlombok/lombok/*/lombok-*.jar | tail -n 1"
):gsub("\n", "")

print('lombok: ' .. lombok_path)

local config = {
	cmd = { "jdtls",
		"--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand(lombok_path)),

	},

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
	capabilities = require('cmp_nvim_lsp').default_capabilities()
}

jdtls.start_or_attach(config)
