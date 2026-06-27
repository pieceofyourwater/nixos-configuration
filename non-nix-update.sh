#!/usr/bin/env bash

# Check if the number of arguments is zero
if [ $# -gt 0 ]; then
    update_flake_path="$1"
else 
    update_flake_path="."
fi

inputs=("non-nix" "dwl")

nix flake update "${inputs[@]}" --flake "$update_flake_path"
