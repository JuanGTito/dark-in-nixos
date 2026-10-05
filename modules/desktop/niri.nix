{ pkgs, ... }:

{
  programs.niri.enable = true;

  hardware.graphics.enable = true;

  security.polkit.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
