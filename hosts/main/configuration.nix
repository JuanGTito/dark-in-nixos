{ config, pkgs, ... }:

{
    imports = [ 
        ./hardware-configuration.nix

	../../modules/core/boot.nix
	../../modules/core/networking.nix
	../../modules/core/audio.nix
	../../modules/core/bluetooth.nix
	../../modules/core/fonts.nix
	../../modules/core/nix.nix
	../../modules/core/users.nix

	../../modules/desktop/niri.nix
	
	../../modules/services/docker.nix
	../../modules/services/ssh.nix
	../../modules/services/printing.nix
    ];

    networking.hostName = "dark-in";

    time.timeZone = "America/Lima";
	
    i18n.defaultLocale = "es_PE.UTF-8";
	
    i18n.extraLocaleSettings = {
	LC_ADDRESS = "es_PE.UTF-8";
	LC_IDENTIFICATION = "es_PE.UTF-8";
	LC_MEASUREMENT = "es_PE.UTF-8";
	LC_MONETARY = "es_PE.UTF-8";
	LC_NAME = "es_PE.UTF-8";
	LC_NUMERIC = "es_PE.UTF-8";
	LC_PAPER = "es_PE.UTF-8";
	LC_TELEPHONE = "es_PE.UTF-8";
	LC_TIME = "es_PE.UTF-8";
    };

    console.keyMap = "la-latin1";

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05";
}

