# Export noctalia config, convert to Nix, format, and display or save
export def noctalia2nix [
  --edit (-e)        # Edit file in neovim
  --full (-f)        # Export full config (including defaults)
  --save (-s): path  # Optionally save output
] {
  let default_path = ($env.HOME | path join "Desktop")

  let export_args = if $full { ["full"] } else { ["merged"] }

  # Export noctalia config and convert to nix
  let raw_nix_config = (
    noctalia config export ...$export_args
    | nix run ($env.HOME | path join "Projects" "toml2nix") -- - --tab "  "
  )

  # Format with nixfmt (safely handle failure)
  let formatted = ($raw_nix_config | nixfmt - | complete)
  let nix_config = if $formatted.exit_code == 0 {
    $formatted.stdout
  } else {
    print -e "(Warning: nixfmt failed to parse config, displaying raw config instead)"
    $raw_nix_config
  }

  # Save nix config if requested
  if $save != null {
    let target = if ($save | is-empty) { $default_path } else { $save }
    $target | path dirname | mkdir $in
    $nix_config | save -f $target
    print $"Saved nix noctalia config to ($target)"
    return
  }

  # Open in Neovim in a temporary file if -e flag is passed
  if $edit {
    let temp_file = (mktemp --tmpdir noctalia-config_XXXXXX.nix)
    $nix_config | save -f $temp_file
    nvim $temp_file
    rm -f $temp_file
    return
  }

  # Default display in bat
  $nix_config | bat --language=nix --file-name="noctalia-config.nix"
}
