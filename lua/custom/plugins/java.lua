return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local jdtls = require 'jdtls'

      local lombok_path = vim.fn.system('ls ~/.m2/repository/org/projectlombok/lombok/*/lombok-*.jar | tail -n 1'):gsub('\n', '')

      local mason = vim.fn.stdpath 'data' .. '/mason/packages'
      local bundles = {
        vim.fn.glob(mason .. '/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'),
      }
      -- com.microsoft.java.test.runner-jar-with-dependencies.jar and jacocoagent.jar are
      -- NOT valid OSGi bundles (no Bundle-SymbolicName manifest) — they're meant to be used
      -- on the test-run classpath, not loaded as jdtls extension bundles. Including them
      -- makes BundleUtils.loadBundles throw on every jdtls init ("Failed to load extension
      -- bundles" in lsp.log), which can break debug/test bundle loading for the session.
      for _, jar in ipairs(vim.split(vim.fn.glob(mason .. '/java-test/extension/server/*.jar'), '\n')) do
        if not jar:match 'com%.microsoft%.java%.test%.runner%-jar%-with%-dependencies%.jar$' and not jar:match 'jacocoagent%.jar$' then
          table.insert(bundles, jar)
        end
      end

      local config = {
        cmd = { 'jdtls', '--jvm-arg=' .. string.format('-javaagent:%s', vim.fn.expand(lombok_path)) },
        root_dir = require('jdtls.setup').find_root { 'pom.xml', 'gradlew', '.git' },
        init_options = {
          bundles = bundles,
        },
      }

      -- lazy.nvim's `config` runs only once (when the plugin first loads on the
      -- first `java` buffer). start_or_attach must run on every java buffer,
      -- so re-run it on every FileType java event, and once now for the buffer
      -- that triggered this load.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        callback = function(args)
          jdtls.start_or_attach(config)

          -- Toggle JDI suspend policy for the whole debug session (java-debug-adapter
          -- setting, session-wide — not per-breakpoint like JetBrains' dialog).
          -- Default upstream is suspendAllThreads=false (SUSPEND_EVENT_THREAD, i.e.
          -- only the thread that hit the breakpoint stops). This flips it to SUSPEND_ALL.
          vim.keymap.set('n', '<leader>dS', function()
            local client = vim.lsp.get_clients({ name = 'jdtls', bufnr = args.buf })[1]
            if not client then
              vim.notify('jdtls client not attached to this buffer', vim.log.levels.WARN)
              return
            end
            client:request('workspace/executeCommand', {
              command = 'vscode.java.updateDebugSettings',
              arguments = { { suspendAllThreads = true } },
            }, function(err)
              if err then
                vim.notify('updateDebugSettings failed: ' .. vim.inspect(err), vim.log.levels.ERROR)
              else
                vim.notify 'suspendAllThreads = true (áp dụng cho session debug tiếp theo)'
              end
            end)
          end, { buffer = args.buf, desc = 'Debug: Suspend ALL threads on breakpoint (JDI)' })
        end,
      })
      jdtls.start_or_attach(config)

      jdtls.setup_dap()

      local dap = require 'dap'
      dap.configurations.java = {
        {
          type = 'java',
          request = 'launch',
          name = 'Spring Boot (dev custom)',
          mainClass = 'com.ubitec.ubiid.UbiidApiApplication',
          projectName = 'ubiid-api',

          vmArgs = '-Dspring.profiles.active=local',
        },
      }
    end,
  },
}
