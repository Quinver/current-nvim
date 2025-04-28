return {
  -- null-ls for general LSP sources
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
        },
      })

      -- Keymap for formatting
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },

  -- mason-null-ls to manage external tools
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",  -- Mason itself
      "nvimtools/none-ls.nvim",   -- null-ls
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "prettier" }, -- Ensure all required tools are installed
        automatic_installation = true,  -- Automatically install missing tools
      })
    end,
  },
  -- Mason plugin for managing external tools
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  }
}
