{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) fetchurl callPackage mkShell;

  lzlib = callPackage ./lzlib.nix {};
  plzip = callPackage ./plzip.nix { inherit lzlib; };

in mkShell {
  nativeBuildInputs = [
    lzlib
    plzip
  ];
}
