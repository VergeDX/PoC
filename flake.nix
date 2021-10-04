{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
  # inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosConfigurations."recurrent" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        {
          nixpkgs.overlays = [
            (self: super: {
              ubootRaspberryPi4_64bit = super.callPackage ./uboot.nix { };
            })
          ];
        }
      ];
    };
  };
}
