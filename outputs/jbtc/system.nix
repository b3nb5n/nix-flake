{ pkgs, ... }: {
  imports = [
    ./hardware.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/efi-boot.nix
    ../../modules/nixos/firewall.nix
    ../../modules/nixos/greetd.nix
    ../../modules/nixos/network-manager.nix
    ../../modules/nixos/portals.nix
    ../../modules/nixos/sound.nix
    ../../modules/nixos/ssh.nix
  ];

  system.stateVersion = "24.05";
  networking.hostName = "jbtc";

  users.users.jb = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };
}