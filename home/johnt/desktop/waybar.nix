{ ... }: {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./assets/waybar.css;
    settings.mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ ];
      modules-center = [ ];
      modules-right = [ "pulseaudio" "network" "clock" "battery" "tray" ];
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
