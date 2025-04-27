{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {nixpkgs, ...}: let
    allSystems = [
      "aarch64-darwin"
      "x86_64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
    forAllSystems = fn: nixpkgs.lib.genAttrs allSystems (system: fn system nixpkgs.legacyPackages.${system});
  in {
    devShell = forAllSystems (
      system: pkgs: let
        elmPkgs = with pkgs.elmPackages; [
          elm-language-server
        ];
      in
        pkgs.mkShell {
          packages = with pkgs;
            [
              deno
              # tailwindcss-language-server
            ]
            ++ elmPkgs;
        }
    );
  };
}
