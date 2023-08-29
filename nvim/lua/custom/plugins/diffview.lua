return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("diffview").setup({
      default_args = {
        DiffviewOpen = { "--untracked-files=no", "--imply-local" },
      },
      keymaps = {
        view = {
          ["<tab>"] = false,
          ["<s-tab>"] = false,
        },
        file_panel = {
          ["<tab>"] = false,
          ["<s-tab>"] = false,
        },
        file_history_panel = {
          ["<tab>"] = false,
          ["<s-tab>"] = false,
        }
      }
    })
  end,
}
