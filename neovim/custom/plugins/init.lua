local overrides = require "custom.plugins.overrides"

---@type {[PluginName]: PluginConfig|false}
local plugins = {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

	['xeluxee/competitest.nvim'] = {
    requires = 'MunifTanjim/nui.nvim',
    config = function()
      require'competitest'.setup {
        testcases_directory = "/.cph",
        testcases_use_single_file = true,
        save_all_files = true,
        compile_directory = "/.cph",
        compile_command = {
          cpp = {
            exec = "g++",
            args = {
              "$(FABSPATH)",
              "-o", "$(FNOEXT)",
              "-std=c++20",
              "-O2",
              "-Wl,-stack_size,0x20000000",
              "-include",
              vim.env.CP_SETUP .. "/include/debug.h"
            }
          },
        },
        running_directory = "/.cph",
        run_command = {
          cpp = { exec = "./$(FNOEXT)" },
        },
        view_output_diff = true,
        template_file = {
          cpp = vim.env.CP_HOME .. "/Resources/Libraries/Personal Library/template.cpp",
        },
      }
    end,
  },

  ["kylechui/nvim-surround"] = {
    tag = "*",
    config = function()
        require("nvim-surround").setup({})
    end,
  },

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins
