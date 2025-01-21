{
  config,
  lib,
  ...
}:
{
  options = {
    gh.enable = lib.mkEnableOption "enables gh";
  };
  
  config = lib.mkIf config.gh.enable {
    programs.gh = {
      enable = true;
      # extensions = [ ]; # https://github.com/topics/gh-extension
    };
  };
}
