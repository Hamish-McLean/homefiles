# List just recipes
default:
    @just --list

# Build home-manager configuration
build:
    nh home-manager build .

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

# Switch to new home-manager configuration
switch:
    nh home-manager switch .

# Update all flake inputs and test evaluation
update:
    nix flake update
    just check
