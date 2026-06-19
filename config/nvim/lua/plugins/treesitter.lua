return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "nix", "bash", "python", "json" },
        sync_install = false,
        auto_install = true,

        highlight = { enable = true },  -- syntax highlighting
        indent = { enable = true },     -- smart indentation
      })
    end,
  },
}

