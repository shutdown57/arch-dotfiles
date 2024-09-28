return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves the default Neovim UI
  },
  config = true,
  opts = {
    adapters = {
      ollama_remote = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "ollama_remote",
          env = {
            url = "http://127.0.0.1:11434",
          },
          headers = {
            ["Content-Type"] = "application/json",
          },
          parameters = {
            sync = true,
          },
          schema = {
            model = {
              -- Available models: reader-lm:latest | qwen2:1.5b | smollm:latest | llama3.1:latest | qwen2.5:7b
              default = "qwen2.5:7b",
            },
            num_ctx = {
              default = 16384,
            },
            num_predict = {
              default = -1,
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "ollama_remote",
      },
      inline = {
        adapter = "ollama_remote",
      },
      agent = {
        adapter = "ollama_remote",
      },
    },
    display = {
      diff = {
        provider = "mini_diff",
      },
    },
  },
}
