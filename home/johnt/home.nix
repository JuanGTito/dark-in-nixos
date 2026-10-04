{ config, pkgs, ... }:

{
    imports = [
        ./programs/git.nix
        ./programs/kitty.nix
        ./programs/shell.nix
        ./programs/browser.nix
        ./programs/editor.nix
	./programs/codex.nix

	./desktop/hyprland.nix
	./desktop/waybar.nix
	./desktop/wofi.nix
	./desktop/notifications.nix
        ./desktop/appearance.nix

    ];
    
    home.username = "johnt";
    home.homeDirectory = "/home/johnt";
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
}
