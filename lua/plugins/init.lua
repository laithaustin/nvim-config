return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      -- Free up Tab for Supermaven; use C-n/C-p for cmp menu nav instead.
      -- Remap LuaSnip snippet jumping to C-l (forward) and C-h (back).
      opts.mapping["<Tab>"] = nil
      opts.mapping["<S-Tab>"] = nil
      opts.mapping["<C-l>"] = cmp.mapping(function(fallback)
        if require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" })
      opts.mapping["<C-h>"] = cmp.mapping(function(fallback)
        if require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      local needed = { "lua", "vim", "vimdoc", "python" }
      for _, parser in ipairs(needed) do
        if not vim.tbl_contains(opts.ensure_installed, parser) then
          table.insert(opts.ensure_installed, parser)
        end
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-smart-history.nvim" },
      { "kkharji/sqlite.lua" },
    },
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"
      
      conf.extensions_list = { "themes", "terms", "live_grep_args", "smart_history" }
      conf.defaults = conf.defaults or {}
      conf.defaults.history = {
        path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
        limit = 100,
      }
      conf.defaults.mappings = conf.defaults.mappings or {}
      conf.defaults.mappings.i = conf.defaults.mappings.i or {}
      conf.defaults.mappings.i["<C-S-Up>"] = actions.cycle_history_next
      conf.defaults.mappings.i["<C-S-Down>"] = actions.cycle_history_prev
      return conf
    end,
  },
  {
    "3rd/image.nvim",
    opts = {
      backend = "ueberzug",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = "popup",
        },
      },
    },
  },
  {
    "sudo-tee/opencode.nvim",
    cmd = { "Opencode" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("opencode").setup(opts)
    end,
  },
}
