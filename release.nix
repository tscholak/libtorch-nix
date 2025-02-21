{ pkgs ? import ./pin/nixpkgs.nix {}, python ? pkgs.python36 }:

let
  pytorch-releases   = pkgs.callPackage ./pytorch/release.nix { inherit python; };
  probtorch-releases = pkgs.callPackage ./probtorch/release.nix { inherit python; };
in
{
  inherit (pytorch-releases)
    # cpu builds
    pytorch pytorch-mkl pytorch-openmpi pytorch-mkl-openmpi pytorchFull
    # cuda dependencies
    magma_250 magma_250mkl
    # cuda builds
    pytorch-cu pytorch-cu-mkl pytorch-cu-mkl-openmpi pytorchWithCuda10Full
    ;

  inherit (probtorch-releases) probtorch probtorchWithCuda;
}
