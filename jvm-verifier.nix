{ compiler ? (import ./configuration.nix).compiler
, nixpkgs  ? import <nixpkgs> { overlays = [(import ./overlay.nix { inherit compiler; })]; }
}:
with nixpkgs;
haskellPackages.callCabal2nix "jvm-verifier" (fetchFromGitHub {
  owner  = "GaloisInc";
  repo   = "jvm-verifier";
  rev    = "f7755eb6016c76345c0fb63dca07c5bffd149ae0";
  sha256 = "0qq28np2v5f43k92zcfkfwsflzbx0kasfq57zdfk1cvchd0ix7ja";
}) {
  inherit (haskellPackages) abcBridge;
  inherit cryptol-verifier;
  inherit saw-core;
  inherit saw-core-aig;
}
