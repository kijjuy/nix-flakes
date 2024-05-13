{
  description = "Python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonEnv = pkgs.python3.withPackages (ps: with ps; [
          flask
          # Add more Python packages here as needed
        ]);
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            pythonEnv
            # Add more build inputs here as needed
          ];
	  NIX_SHELL = "nix-shell";  
        };
      }
    );
}
