{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  options = {
    nvf.enable = lib.mkEnableOption "enable nvf";
  };

  config = lib.mkIf config.nvf.enable {
    programs.nvf = {
      enable = true;
      enableManpages = true;
      defaultEditor = true;
    };

    programs.nvf.settings.vim = {
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;

      bell = "on";

      binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };

      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };

      comments.comment-nvim.enable = true;

      # filetree.neo-tree.enable = true; # replaced with snacks explorer

      git.enable = true;

      globals = {
        vim_markdown_folding_disable = true;
        vim_markdown_folding_level = 99;
      };

      keymaps = import ./keymaps.nix { };

      languages = {
        bash.enable = true;
        enableFormat = true;
        enableTreesitter = false; # HACK: disable automatic treesitter grammars
        go.enable = true;
        html.enable = true;
        julia.enable = true;
        lua.enable = true;
        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
        nix = {
          enable = true;
          format.type = [ "nixfmt" ];
          lsp.servers = [ "nixd" ];
        };
        nu.enable = true;
        python.enable = true;
        r.enable = true;
        rust.enable = true;
        tex.enable = true;
        yaml.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;
        # lightbulb = {
        #   enable = true;
        #   setupOpts = {
        #     autocmd = {
        #       enabled = true;
        #       events = [
        #         "CursorHold"
        #         "CursorHoldI"
        #         "BufEnter"
        #       ];
        #     };
        #     code_lenses = true;
        #     virtual_text = {
        #       enabled = false;
        #     };
        #   };
        # };
        lspconfig.enable = true;
        lspkind.enable = true;
        lspsaga = {
          # Popup windows for code actions etc. Could replace with snacks
          enable = true;
          setupOpts = {
            lightbulb.virtual_text = false;
            finder.enable = false;
          };
        };
        # lspSignature.enable = true; # incompatible with blink-cmp
        # mappings = { }; # configure lsp keybinds "<leader>l"
        nvim-docs-view.enable = true; # hover docs in side panel
        otter-nvim.enable = true; # lsp features for code within other documents
        trouble.enable = true; # diagnostics panel
      };

      mini.icons.enable = true;

      notes = {
        obsidian = {
          enable = true;
          setupOpts = {
            completion.nvim_cmp = true;
            workspaces = [
              {
                name = "Obsidian";
                path = "~/Obsidian";
              }
            ];
          };
        };
        todo-comments.enable = true;
      };

      options = {
        expandtab = true; # Ensure spaces are used instead of tabs
        foldlevel = 99;
        foldlevelstart = 99;
        scrolloff = 999; # keep current line centered
        shiftwidth = 0; # set to 0 to use tabstop
        tabstop = 2;
      };

      # projects.project-nvim.enable = true; replaced by snacks.picker

      statusline.lualine.enable = true;

      tabline.nvimBufferline.enable = true; # tabs "<leader>b"

      # telescope.enable = true;

      # terminal.toggleterm = { # replaced with snacks terminal and lazygit
      #   # terminal "<c-t>"
      #   enable = true;
      #   lazygit = {
      #     enable = true;
      #     package = null; # null to use PATH
      #   };
      # };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      # HACK: manually add treesitter grammars due to issues with the automatic system
      treesitter = {
        addDefaultGrammars = false;
        enable = true;
        # grammars = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
        grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          bibtex
          go
          html
          julia
          lua
          markdown
          nix
          nu
          python
          r
          regex
          rust
          latex
          yaml
        ];
      };

      ui = {
        borders.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
        colorful-menu-nvim.enable = true;
        fastaction.enable = true; # code actions
        # illuminate.enable = true; # replaced by snacks words
        modes-nvim = {
          enable = true; # highlights lines based on mode
          setupOpts.colors = {
            copy = "#fab387";
            delete = "#f38ba8";
            insert = "#74c7ec";
            visual = "#cba6f7";
          };
        };
        noice.enable = true;
        nvim-highlight-colors.enable = true;
        #nvim-ufo.enable = true; # code folding, learn how to use first
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            julia = "92";
            nix = [
              "100"
              "120"
            ];
            python = "88";
            R = "80";
            rust = "100";
          };
        };
      };

      utility = {
        #images.image-nvim.enable = true; # didn't work
        oil-nvim = {
          enable = true;
          gitStatus.enable = true;
        };
        outline.aerial-nvim.enable = true;
        motion = {
          flash-nvim = {
            enable = true;
            setupOpts = {
              modes.search.enable = true;
              modes.char.enable = true;
            };
          };
          #leap.enable = true;
          # precognition.enable = true; # motion hints, has various config options
        };
        multicursors.enable = true;
        nix-develop.enable = true;
        nvim-biscuits.enable = true;
        #preview.markdownPreview # settings for markdownPreview here
        snacks-nvim = {
          # collection of small QoL plugins
          # TODO: keybinds for snacks
          enable = true;
          setupOpts = {
            animate.enabled = true; # animations
            bigfile.enabled = true; # optimisation for big files
            bufdelete.enabled = true; # delete buffers safely
            dashboard = {
              enabled = true; # dashboard
              # TODO: configure layout
              # (examples at https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md)
              sections = [
                { section = "header"; }
                {
                  icon = " ";
                  title = "Keymaps";
                  section = "keys";
                  indent = 2;
                  padding = 1;
                }
                {
                  icon = " ";
                  title = "Recent Files";
                  section = "recent_files";
                  indent = 2;
                  padding = 1;
                }
                {
                  icon = " ";
                  title = "Projects";
                  section = "projects";
                  indent = 2;
                  padding = 1;
                }
                # { section = "startup"; }
              ];
              # sections = [
              #   { section = "header"; }
              #   {
              #     section = "keys";
              #     gap = 1;
              #     padding = 1;
              #   }
              #   # { section = "footer"; }
              # ];
              # preset = {
              #   header = null;
              #   keys = null;
              # };
            };
            dim.enabled = true; # dim context outside of scope
            explorer.enabled = true; # file manager, could replace neotree
            git.enabled = true; # git tools
            image.enabled = true; # images in files using kitty protocol
            indent.enabled = true; # indentation lines
            input.enabled = true; # command window
            keymap.enabled = true; # keybind extensions
            lazygit.enabled = true; # lazygit window
            # notifier.enabled = true; # notifications, currently handled by noice
            picker.enabled = true; # fuzzy finder, needs keybinds
            scope.enabled = true; # identify code scopes
            scroll.enabled = true; # scrolling animations
            statuscolumn.enabled = true; # side-gutters with git signs, symbols, and line numbers
            terminal.enabled = true; # togglable terminal
            toggle.enabled = true; # unifies status toggles in WhichKey
            words.enabled = true; # highlights matching words
          };
        };
        #surround.enable = true; # for surrounding delimiters, seems overly complicated
        #undotree # to navigate undo history trees
        #yanky-nvim # for better yank and put, seems complicated
        yazi-nvim.enable = true; # <leader>cw or <c-up>
      };

      viAlias = true;
      vimAlias = true;

      visuals = {
        # cinnamon-nvim.enable = true; # replaced with snacks.scroll
        # indent-blankline.enable = true; # replaced with snacks.indent
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
      };
    };

    # HACK: fixes broken auto indentation
    programs.nvf.settings.vim.autocmds = [
      {
        enable = true;
        event = [ "BufEnter" ];
        pattern = [ "*" ];
        command = "setlocal indentexpr=nvim_treesitter#indent()";
      }
    ];

    programs.nvf.settings.vim.extraPackages = with pkgs; [
      gcc
      tree-sitter
    ];

  };
}
