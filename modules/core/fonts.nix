{  pkgs, ...  }:

{
    fonts.packages = with pkgs; [
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-color-emoji

	liberation_ttf

	nerd-fonts.jetbrains-mono
	nerd-fonts.fira-code
    ];

    fonts.fontconfig = {
   	enable = true;

	defaultFonts = {
	    monospace = [ "JetBrainsMono Nerd Font" ];
	    sansSerif = [ "Noto Sans" ];
	    serif = [ "Noto Serif" ];
	    emoji = [ "Noto Color Emoji" ];
	};
    };
}
