_: [
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

  # Code Actions
  {
    key = "<leader>ca";
    mode = [
      "n"
      "v"
    ];
    action = "<cmd>lua Snacks.picker.lsp_actions()<CR>";
    desc = "LSP Code Actions";
  }
  # Diagnostics (Workspace or Buffer)
  {
    key = "<leader>xx";
    mode = [ "n" ];
    action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
    desc = "Workspace Diagnostics";
  }
  {
    key = "<leader>xX";
    mode = [ "n" ];
    action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
    desc = "Buffer Diagnostics";
  }
  # LSP Rename
  {
    key = "<leader>rn";
    mode = [ "n" ];
    action = "<cmd>lua Snacks.rename.rename()<CR>";
    desc = "LSP Rename";
  }
  # Symbol Search / Navigation
  {
    key = "gd";
    mode = [ "n" ];
    action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
    desc = "Goto Definition";
  }
  {
    key = "gr";
    mode = [ "n" ];
    action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
    desc = "Goto References";
  }
  {
    key = "<leader>ss";
    mode = [ "n" ];
    action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
    desc = "Document Symbols";
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
