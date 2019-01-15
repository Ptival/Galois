{ compiler ? (import ./configuration.nix).compiler
, nixpkgs  ? import <nixpkgs> { overlays = [(import ./overlay.nix { inherit compiler; })]; }
}:
with nixpkgs;
haskellPackages.callCabal2nix "cryptol" (fetchFromGitHub {
  owner  = "GaloisInc";
  repo   = "cryptol";
  rev    = "5bad18d3d7b7b925bcde516814bea817e219c134";
  sha256 = "18wpzxs7sdp1mlfzgq76z2bbdskmclpd1g8ick1cc00vlfdsc55h";
}) {}