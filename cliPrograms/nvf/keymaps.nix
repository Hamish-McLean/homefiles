{ ... }:
[
  # Snacks Explorer
  {
    key = "<leader>e";
    action = "<cmd>lua Snacks.explorer()<CR>";
    mode = [ "n" ];
    desc = "Toggle Snacks Explorer";
  }

  # Snacks Terminal
  {
    key = "<c-t>";
    action = "<cmd>lua Snacks.terminal()<CR>";
    mode = [
      "n"
      "t" # "t" mode allows toggling it closed while inside the terminal
    ];
    desc = "Toggle Snacks Terminal";
  }

  # Snacks Picker & Projects
  {
    key = "<leader>ff";
    action = "<cmd>lua Snacks.picker.files()<CR>";
    mode = [ "n" ];
    desc = "Find Files";
  }
  {
    key = "<leader>fr";
    action = "<cmd>lua Snacks.picker.recent()<CR>";
    mode = [ "n" ];
    desc = "Recent Files";
  }
  {
    key = "<leader>fp";
    action = "<cmd>lua Snacks.picker.projects()<CR>";
    mode = [ "n" ];
    desc = "Projects";
  }
  {
    key = "<leader>sb";
    action = "<cmd>lua Snacks.picker.lines()<CR>";
    mode = [ "n" ];
    desc = "Search Lines";
  }
  {
    key = "<leader>sg";
    action = "<cmd>lua Snacks.picker.grep()<CR>";
    mode = [ "n" ];
    desc = "Live Grep";
  }
  {
    key = "<leader>sw";
    action = "<cmd>lua Snacks.picker.grep_word()<CR>";
    mode = [ "n" ];
    desc = "Search word";
  }

  # Snacks Git
  {
    key = "<leader>lg";
    action = "<cmd>lua Snacks.lazygit()<CR>";
    mode = [ "n" ];
    desc = "Lazygit";
  }
  {
    key = "<leader>gb";
    action = "<cmd>lua Snacks.git.blame()<CR>";
    mode = [ "n" ];
    desc = "Git Blame Line";
  }
  {
    key = "<leader>gd";
    action = "<cmd>lua Snacks.picker.git_diff()<CR>";
    mode = [ "n" ];
    desc = "Git Diffs";
  }

  # Buffer Management
  {
    key = "<leader>bb";
    action = "<cmd>lua Snacks.picker.buffers()<CR>";
    mode = [ "n" ];
    desc = "Find Open Buffers";
  }
  {
    key = "<leader>bd";
    action = "<cmd>lua Snacks.bufdelete()<CR>";
    mode = [ "n" ];
    desc = "Delete Buffer Safely";
  }
]
