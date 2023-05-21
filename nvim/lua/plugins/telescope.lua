return {
  'nvim-telescope/telescope.nvim',
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  lazy = false,
  config = function()
    local telescope = require("telescope")
    local actions = require('telescope.actions')
    local builtin = require("telescope.builtin")

    local function telescope_buffer_dir()
      return vim.fn.expand('%:p:h')
    end

    local fb_actions = require "telescope".extensions.file_browser.actions

    telescope.setup {
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          prompt_position = "top",
        },
        dynamic_preview_title = true,
        prompt_prefix = "  ",
        selection_caret = " ",
        path_display = { 'truncate' },
        file_ignore_patterns = { "node_modules", "vendor/bundle", "%.jpg", "%.png" },
        history = {
          path = vim.fn.stdpath('data') .. '/telescope_history.sqlite3',
        },
        mappings = {
          n = {
            ["q"] = actions.close
          },
          i = {
            ['<Tab>'] = actions.toggle_selection,
            ["<C-[>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-g>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        },
      },
      extensions = {
        fzf = {
          case_mode = "smart_case",
          fuzzy = true,
          override_file_sorter = true,
          override_generic_sorter = true,
        },
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function() vim.cmd('normal vbd') end,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd('startinsert')
              end
            },
          },
        },
      },
    }

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")

    vim.keymap.set('n', ';f',
      function()
        builtin.find_files({
          no_ignore = false,
          hidden = false
        })
      end)
    vim.keymap.set('n', ';r', function()
      builtin.live_grep()
    end)
    vim.keymap.set('n', '\\\\', function()
      builtin.buffers()
    end)
    vim.keymap.set('n', ';t', function()
      builtin.help_tags()
    end)
    vim.keymap.set('n', ';;', function()
      builtin.resume()
    end)
    vim.keymap.set('n', ';e', function()
      builtin.diagnostics()
    end)
    vim.keymap.set("n", "sf", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = true,
        initial_mode = "normal",
        layout_config = { height = 40 }
      })
    end)
  end
}
