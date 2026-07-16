{
  config,
  lib,
  ...
}:

let
  darkFlavour = "mocha";
  lightFlavour = "frappe";

  primary = "sapphire"; # #74c7ec
  secondary = "teal"; # #94e2d5
  tertiary = "green"; # #a6e3a1

  inherit (config.catppuccin.sources) palette;
  paletteJSON = (lib.importJSON "${palette}/palette.json");
  darkPalette = paletteJSON.${darkFlavour}.colors;
  lightPalette = paletteJSON.${lightFlavour}.colors;

  customCatppuccin = {
    dark =
      let
        colours = darkPalette;
      in
      {
        mPrimary = colours.${primary}.hex; # sapphire #74c7ec
        mOnPrimary = colours.mantle.hex; # #181825
        mSecondary = colours.${secondary}.hex; # teal #94e2d5
        mOnSecondary = colours.mantle.hex; # #181825
        mTertiary = colours.${tertiary}.hex; # green #a6e3a1
        mOnTertiary = colours.mantle.hex; # #181825
        mError = colours.red.hex; # #f38ba8
        mOnError = colours.mantle.hex; # #181825
        mSurface = colours.base.hex; # #1e1e2e
        mOnSurface = colours.text.hex; # #cdd6f4
        mSurfaceVariant = colours.surface0.hex; # #313244
        mOnSurfaceVariant = colours.blue.hex; # #89b4fa
        mOutline = colours.surface1.hex; # #45475a
        mShadow = colours.crust.hex; # #11111b
        mHover = colours.blue.hex; # #89b4fa
        mOnHover = colours.crust.hex; # #11111b
        terminal = {
          foreground = colours.text.hex; # #cdd6f4
          background = colours.base.hex; # #1e1e2e
          selectionFg = colours.text.hex; # #cdd6f4
          selectionBg = colours.surface2.hex; # #585b70
          cursorText = colours.base.hex; # #1e1e2e
          cursor = colours.rosewater.hex; # #f5e0dc
          normal = {
            black = colours.surface1.hex; # #45475a
            red = colours.red.hex; # #f38ba8
            green = colours.green.hex; # #a6e3a1
            yellow = colours.yellow.hex; # #f9e2af
            blue = colours.blue.hex; # #89b4fa
            magenta = colours.pink.hex; # #f5c2e7
            cyan = colours.teal.hex; # #94e2d5
            white = colours.text.hex; # #a6adc8
          };
          bright =
            let
              colours = paletteJSON.latte.colors;
            in
            {
              black = colours.text.hex; # #4c4f69
              red = colours.red.hex; # #d20f39
              green = colours.green.hex; # #40a02b
              yellow = colours.yellow.hex; # #df8e1d
              blue = colours.blue.hex; # #1e66f5
              magenta = colours.pink.hex; # #ea76cb
              cyan = colours.teal.hex; # #179299
              white = colours.text.hex; # #4c4f69
            };
        };
      };
    light =
      let
        colours = lightPalette;
      in
      {
        mPrimary = colours.${primary}.hex; # sapphire #74c7ec
        mOnPrimary = colours.mantle.hex; # #181825
        mSecondary = colours.${secondary}.hex; # teal #94e2d5
        mOnSecondary = colours.mantle.hex; # #181825
        mTertiary = colours.${tertiary}.hex; # green #a6e3a1
        mOnTertiary = colours.mantle.hex; # #181825
        mError = colours.red.hex; # #f38ba8
        mOnError = colours.mantle.hex; # #181825
        mSurface = colours.base.hex; # #1e1e2e
        mOnSurface = colours.text.hex; # #cdd6f4
        mSurfaceVariant = colours.surface0.hex; # #313244
        mOnSurfaceVariant = colours.blue.hex; # #89b4fa
        mOutline = colours.surface1.hex; # #45475a
        mShadow = colours.crust.hex; # #11111b
        mHover = colours.blue.hex; # #89b4fa
        mOnHover = colours.crust.hex; # #11111b
        terminal = {
          foreground = colours.text.hex; # #cdd6f4
          background = colours.base.hex; # #1e1e2e
          selectionFg = colours.text.hex; # #cdd6f4
          selectionBg = colours.surface2.hex; # #585b70
          cursorText = colours.base.hex; # #1e1e2e
          cursor = colours.rosewater.hex; # #f5e0dc
          normal = {
            black = colours.surface1.hex; # #45475a
            red = colours.red.hex; # #f38ba8
            green = colours.green.hex; # #a6e3a1
            yellow = colours.yellow.hex; # #f9e2af
            blue = colours.blue.hex; # #89b4fa
            magenta = colours.pink.hex; # #f5c2e7
            cyan = colours.teal.hex; # #94e2d5
            white = colours.text.hex; # #a6adc8
          };
          bright =
            let
              colours = paletteJSON.latte.colors;
            in
            {
              black = colours.text.hex; # #4c4f69
              red = colours.red.hex; # #d20f39
              green = colours.green.hex; # #40a02b
              yellow = colours.yellow.hex; # #df8e1d
              blue = colours.blue.hex; # #1e66f5
              magenta = colours.pink.hex; # #ea76cb
              cyan = colours.teal.hex; # #179299
              white = colours.text.hex; # #4c4f69
            };
        };
      };
  };
in
{
  config = lib.mkIf config.noctalia.enable {
    xdg.configFile."noctalia/palettes/Catppuccin Custom.json".text = builtins.toJSON customCatppuccin;
  };
}
