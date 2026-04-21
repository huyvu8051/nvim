-- Trong phần cấu hình Mason
local servers = {
  bashls = {}, -- Kích hoạt LSP
}

require('mason-tool-installer').setup {
  ensure_installed = {
    'bashls', -- LSP
    'shellcheck', -- Linter (Bắt lỗi)
    'shfmt', -- Formatter (Làm đẹp code)
  },
}
