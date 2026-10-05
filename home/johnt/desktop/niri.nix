{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    swaybg
    wl-clipboard
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
            spawn "kitty";
        }

        Mod+D {
            spawn "wofi" "--show" "drun";
        }

        Mod+Q {
            close-window;
        }

        Mod+Shift+E {
            quit;
        }
    }

    spawn-at-startup "waybar"
    spawn-at-startup "mako"
    spawn-at-startup "${pkgs.swaybg}/bin/swaybg" "-i" "${./assets/wall.png}" "-m" "fill"
    spawn-at-startup "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
  '';
}
