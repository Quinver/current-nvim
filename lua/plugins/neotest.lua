return {
   "nvim-neotest/neotest",
   dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
   },
   config = function()
      require("neotest").setup({
         adapters = {
            require("neotest-python")({
               dap = { enabled = true },
            }),
            require("neotest-plenary"),
            require("neotest-vim-test")({
               ignore_file_types = { "vim", "lua" },
            }),
         },
      })

          -- Key mappings for Neotest
          vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require'neotest'.run.run()<CR>", { noremap = true })
      vim.api.nvim_set_keymap(
         "n",
         "<leader>tf",
         ":lua require'neotest'.run.run(vim.fn.expand('%'))<CR>",
         { noremap = true }
      )
      vim.api.nvim_set_keymap("n", "<leader>tn", ":lua require'neotest'.run.run_nearest()<CR>", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>ts", ":lua require'neotest'.summary.toggle()<CR>", { noremap = true })
   end,
}
