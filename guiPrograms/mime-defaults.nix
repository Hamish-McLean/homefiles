/*
  XDG mime default apps

  Most of these seem to be set already
*/
{
  config,
  lib,
  ...
}:
with lib;
{
  options.mime-defaults = {
    enable = mkEnableOption "enable XDG mime default apps";
    browser = mkOption {
      default = "firefox.desktop";
      description = "Default web browser";
      type = types.str;
    };
    editor = mkOption {
      default = "nvim.desktop";
      description = "Default editor";
      type = types.str;
    };
    files = mkOption {
      default = "yazi.desktop";
      description = "Default file explorer";
      type = types.str;
    };
    markdown = mkOption {
      default = "nvim.desktop";
      description = "Default markdown editor";
      type = types.str;
    };
    pdf = mkOption {
      default = "org.pwmt.zathura.desktop"; # "org.pwmt.zathura-pdf-mupdf.desktop";
      description = "Default viewer for PDFs and EPUBs";
      type = types.str;
    };
  };

  config = mkIf config.mime-defaults.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/epub/zip" = [ config.mime-defaults.pdf ];
        "application/json" = [ config.mime-defaults.editor ];
        "application/pdf" = [ config.mime-defaults.pdf ];
        "application/xhtml+xml" = [ config.mime-defaults.browser ];
        "application/xml" = [ config.mime-defaults.editor ];

        "inode/directory" = [ config.mime-defaults.files ];

        "text/html" = [ config.mime-defaults.browser ];
        "text/markdown" = [ config.mime-defaults.markdown ];
        "text/plain" = [ config.mime-defaults.editor ];

        "x-scheme-handler/about" = [ config.mime-defaults.browser ];
        "x-scheme-handler/http" = [ config.mime-defaults.browser ];
        "x-scheme-handler/https" = [ config.mime-defaults.browser ];
        "x-scheme-handler/unknown" = [ config.mime-defaults.browser ];
      };
    };
  };
}
