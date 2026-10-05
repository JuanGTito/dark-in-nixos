{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-blue-compact";
      package = pkgs.catppuccin-gtk.override { size = "compact"; accents = [ "blue" ]; variant = "macchiato"; };
    };
    iconTheme = { name = "Papirus-Dark"; package = pkgs.papirus-icon-theme; };
    cursorTheme = { name = "catppuccin-macchiato-blue-cursors"; package = pkgs.catppuccin-cursors.macchiatoBlue; size = 24; };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  home.pointerCursor = {
    enable = true;
    name = "catppuccin-macchiato-blue-cursors";
    package = pkgs.catppuccin-cursors.macchiatoBlue;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
