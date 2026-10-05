{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  xdg.configFile."niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "latam"
            }
        }

        touchpad {
            natural-scroll
        }
    }

    layout {
        gaps 10
    }

    binds {
        Mod+Return {
            spawn "kitty"
        }

        Mod+D {
            spawn "wofi" "--show" "drun"
        }

        Mod+Q {
            close-window
        }

        Mod+Shift+E {
            quit
        }
    }

    spawn-at-startup "waybar"
    spawn-at-startup "mako"
  '';
}
