# List just recipes
default:
    @just --list

# Build home-manager configuration
build:
    nh home build .

# Check code-quality and validate flake evaluation
check:
    statix check . --ignore ".direnv,result,result-*"
    nix flake check

# Diff current system profile against last build generation
diff:
    @echo "--- Comparing current system with build result ---"
    nvd diff /run/current-system result/

# Format all nix files
fmt:
    nix fmt

# Inspect flake
inspect:
  nix-inspect --expr 'builtins.getFlake "{{justfile_directory()}}"'

# Switch to new home-manager configuration
switch:
    nh home switch .

# Update all flake inputs and test evaluation
update:
    nix flake update
    just check
