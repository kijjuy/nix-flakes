{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
	pkgs = import nixpkgs { inherit system; };
	dotnet-sdk = pkgs.dotnet-sdk_8;
      in
      {
        devShell = pkgs.mkShell {
	  buildInputs = [
	    dotnet-sdk
	  ];
	};
      }
    );
}
