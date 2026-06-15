# Project Overview
NixOS configuration managed with **flakes**, utilizing **flake-parts** and **import-tree** for a modular structure.

## Architecture
The project uses `import-tree` to automatically discover and import modules from the `modules/` directory.

- `modules/hosts/`: Defines specific host configurations (e.g., `nova`).
- `modules/nixosModules/`: General NixOS modules.
- `modules/homeModules/`: Home Manager modules.
- `modules/packages/`: Custom package definitions.

## Conventions
- Host configurations should be placed in `modules/hosts/`.
- Reusable NixOS modules belong in `modules/nixosModules/`.
