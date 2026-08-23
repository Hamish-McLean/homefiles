# Connect to tmux sessions via sesh
export def --env --wrapped s [...target: string] {
  let path_str = ($env.PATH | str join ":")
  
  let session = if ($target | is-empty) {
    with-env { PATH: $path_str } {
      sesh list --icons | fzf --ansi --preview 'sesh preview {}'
    }
  } else {
    $target | str join " "
  }

  if not ($session | is-empty) {
    sesh connect $session
  }
}
