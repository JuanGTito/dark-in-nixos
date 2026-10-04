{ ... }: {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./assets/waybar.css;
    settings.mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "pulseaudio" "network" "clock" "battery" "tray" ];
      "hyprland/workspaces" = {
        on-click = "activate";
        persistent-workspaces = { "1" = []; "2" = []; "3" = []; "4" = []; "5" = []; };
      };
      "hyprland/window".max-length = 45;
      clock = { format = "{:%H:%M  %d/%m}"; format-alt = "{:%d/%m/%Y}"; };
      network = {
        format-wifi = " {essid}";
        format-ethernet = "󰈀 Ethernet";
        format-disconnected = "Sin red";
        tooltip-format = "{ipaddr}";
      };
      pulseaudio = { format = " {volume}%"; format-muted = "󰝟 Silencio"; scroll-step = 5; };
      battery = { format = " {capacity}%"; format-charging = " {capacity}%"; states = { warning = 25; critical = 10; }; };
      tray = { icon-size = 16; spacing = 10; };
    };
  };
}
