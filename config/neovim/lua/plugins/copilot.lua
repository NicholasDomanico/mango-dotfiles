return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = false,
        keymap = {
          accept = "<Tab>", -- Accept suggestion with Tab
          accept_word = false,
          accept_line = false,
          next = "<M-]>",   -- Alt + ] for next suggestion
          prev = "<M-[>",   -- Alt + [ for previous suggestion
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    })
  end,
}

