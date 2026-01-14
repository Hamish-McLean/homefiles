{
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  options = {
    nvf.enable = lib.mkEnableOption "enables nvf";
  };

  config = lib.mkIf config.nvf.enable {
    programs.nvf = {

      enable = true;
      enableManpages = true;
      defaultEditor = true;

      settings.vim = {

        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
        };

        binds = {
          cheatsheet.enable = true;
          whichKey.enable = true;
        };

        filetree.neo-tree.enable = true;

        git.enable = true;

        languages = {
          bash.enable = true;
          enableFormat = true;
          enableTreesitter = true;
          go.enable = true;
          julia.enable = true;
          lua.enable = true;
          markdown = {
            enable = true;
            extensions.render-markdown-nvim.enable = true;
          };
          nix = {
            enable = true;
            format.type = ["nixfmt"];
            lsp.servers = ["nixd"];
          };
          nu.enable = true;
          python.enable = true;
          r.enable = true;
          rust.enable = true;
          yaml.enable = true;
        };

        lsp.enable = true;

        options = {
          tabstop = 2;
          shiftwidth = 0; # set to 0 to use tabstop
        };

        statusline.lualine.enable = true;

        tabline.nvimBufferline.enable = true;

        telescope.enable = true;

        terminal.toggleterm = {
          enable = true;
          lazygit = {
            enable = true;
            package = null; # null to use PATH
          };
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        ui = {
          borders.enable = true;
          breadcrumbs.enable = true;
          colorful-menu-nvim.enable = true;
          illuminate.enable = true; # illuminates other uses of a word
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
          smartcolumn.enable = true;
        };

        utility = {
          #images.image-nvim.enable = true; # didn't work
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
            precognition.enable = true; # motion hints, has various config options
          };
          multicursors.enable = true;
          nvim-biscuits.enable = true;
          #preview.markdownPreview # settings for markdownPreview here
          #snacks.nvim # collection of small QoL plugins
          #surround.enable = true; # for surrounding delimiters, seems overly complicated
          #undotree # to navigate undo history trees
          #yanky-nvim # for better yank and put, seems complicated
          yazi-nvim.enable = true;
        };

        viAlias = true;
        vimAlias = true;
 
        visuals = {
          indent-blankline.enable = true;
          nvim-web-devicons.enable = true;
        };

      };
    };
  };
}
