/*
  MangoHud

  A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more.

  https://mangohud.org/
  https://github.com/flightlessmango/MangoHud
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    mangohud.enable = lib.mkEnableOption "enable mangohud";
  };

  config = lib.mkIf config.mangohud.enable {
    programs.mangohud = {
      enable = true;
      enableSessionWide = false;

      settings = {
        # Performance Layout
        fps = true;
        frametime = true;
        frame_timing = true;

        # CPU / GPU Tracking
        cpu_stats = true;
        cpu_temp = true;
        gpu_stats = true;
        gpu_temp = true;
        vram = true;
        ram = true;

        # Position & Sizing
        position = "top-left";
        round_corners = 8;
        font_size = 24;
        background_alpha = "0.6";

        # Keybind to toggle HUD visibility ingame (Shift_L + F12)
        toggle_hud = "Shift_L+F12";
      };
    };
    catppuccin.mangohud.enable = true;
  };
}
