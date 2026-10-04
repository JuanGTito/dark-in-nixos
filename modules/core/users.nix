{  pkgs, ...  }:

{
    programs.zsh.enable = true;
    users.users.johnt = {
	isNormalUser = true;
	description = "johnt";
	shell = pkgs.zsh;
	
	extraGroups = [
	    "wheel"
	    "networkmanager"
	    "audio"
	    "video"
	    "docker"
	];
    };
}
