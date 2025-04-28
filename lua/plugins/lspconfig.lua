return {
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup({})
      end,
   },
   {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
   },
   {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      opts = {
         auto_install = true,
      },
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
         })
      end,
   },
   {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
         local lspconfig = require("lspconfig")

         require("mason-lspconfig").setup_handlers({
            function(server_name)
               lspconfig[server_name].setup({})
            end,
         })

         vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
               local opts = { buffer = event.buf }
               vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
               vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
               vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
               vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
         })
      end,
   },
   {
      "mfussenegger/nvim-dap",
      config = function()
         vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true })
         vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true })
         vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true })
         vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true })
         vim.api.nvim_set_keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
      end,
   },
   {
      "jay-babu/mason-nvim-dap.nvim",
      config = function()
         require("mason-nvim-dap").setup({
            ensure_installed = { "python" },
            automatic_installation = true,
            handlers = {
               function(config)
                  -- all sources with no handler get passed here

                  -- Keep original functionality
                  require("mason-nvim-dap").default_setup(config)
               end,
               python = function(config)
                  config.adapters = {
                     type = "executable",
                     command = "/usr/bin/python3",
                     args = {
                        "-m",
                        "debugpy.adapter",
                     },
                  }
                  require("mason-nvim-dap").default_setup(config) -- don't forget this!
               end,
            },
         })
      end,
   },
}
