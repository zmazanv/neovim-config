{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable-small";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs: let
    perSystem = let
      inherit (inputs.nixpkgs) lib;
    in
      f:
        lib.genAttrs (import inputs.systems) (
          system:
            f {
              inherit lib;
              pkgs = inputs.nixpkgs.legacyPackages.${system};
            }
        );
  in {
    devShells = perSystem (import ./shell.nix);
  };
}
