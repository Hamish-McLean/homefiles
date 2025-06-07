/*
>fzf - command-line fuzzy finder

fzf is a general-purpose command-line fuzzy finder.
It's an interactive filter program for any kind of list; 
files, command history, processes, hostnames, bookmarks, git commits, etc. 
It implements a "fuzzy" matching algorithm, 
so you can quickly type in patterns with omitted characters and still get the results you want.

https://github.com/junegunn/fzf
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    fzf.enable = lib.mkEnableOption "enables fzf";
  };
  config = lib.mkIf config.fzf.enable {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      defaultOptions = [
        "--style=full"
        "--preview='bat --color=always {}'"
      ];
      tmux.enableShellIntegration = true;
    };
    catppuccin.fzf.enable = true;
  };
}
