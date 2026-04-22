return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter").setup()

    local parsers = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
      "go",
      "python",
    }
    require("nvim-treesitter").install(parsers)

    local ft_to_parser = {
      javascriptreact = "javascript",
      typescriptreact = "tsx",
      sh = "bash",
      zsh = "bash",
      gitconfig = "git_config",
    }

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = ft_to_parser[ft] or ft
        pcall(vim.treesitter.start, args.buf, lang)
      end,
    })

    require("nvim-ts-autotag").setup()
  end,
}
