{ ... }: {
  programs.kitty = {
    enable = true;
    font = { name = "JetBrainsMono Nerd Font"; size = 12; };
    settings = { confirm_os_window_close = 0; background_opacity = "0.8"; cursor_shape = "block"; };
    extraConfig = builtins.readFile ../desktop/assets/kitty-macchiato.conf;
  };
}
