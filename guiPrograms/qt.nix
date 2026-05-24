{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    qt_config.enable = lib.mkEnableOption "enables qt";
  };

  config = lib.mkIf config.qt_config.enable {
    # GTK QT
    # qt = {
    #   enable = true;
    #   platformTheme.name = "gtk";
    #   style.name = "adwaita-dark";
    #   style.package = pkgs.adwaita-qt;
    # };

    # Catppuccin qt via kvantum
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.name = "kvantum";
    };
    # environment.variables = {
    #   QT_QPA_PLATFORMTHEME = "qt5ct";
    # };
    # catppuccin.kvantum = {
    #   enable = true;
    #   apply = true;
    # };
    # home.sessionVariables = {
    #   # QT_STYLE_OVERRIDE = "kvantum";
    #   QT_QPA_PLATFORMTHEME = "qtct";
    # };
    home.packages = with pkgs; [
      # (catppuccin-kvantum.override {
      #   variant = "mocha";
      #   accent = "sapphire";
      # })
      kdePackages.qtstyleplugin-kvantum
      kdePackages.qt6ct
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
    ];
  };
}
