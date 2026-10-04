{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # UWSM manages the session; Home Manager's target restart stops it.
    systemd.enable = false;
    configType = "lua";
    extraConfig = ''
      local mod = "SUPER"
      hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
      hl.config({ input = { kb_layout = "latam", touchpad = { natural_scroll = true } } })
      hl.config({
        general = {
          gaps_in = 5, gaps_out = 10, border_size = 1, layout = "dwindle",
          col = {
            active_border = { colors = { "rgb(8aadf4)", "rgb(24273a)", "rgb(24273a)", "rgb(8aadf4)" }, angle = 45 },
            inactive_border = "rgb(24273a)",
          },
        },
        decoration = {
          rounding = 10,
          blur = { enabled = true, size = 2, passes = 2 },
          shadow = { enabled = true, range = 4, render_power = 3, color = 0xee1a1a1a },
        },
        animations = { enabled = true },
      })
      hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
      hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "overshot", style = "slide" })
      hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
      hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
      hl.bind(mod .. " + Q", hl.dsp.window.close())
      hl.bind(mod .. " + D", hl.dsp.exec_cmd("wofi --show drun"))
      hl.bind(mod .. " + F", hl.dsp.exec_cmd("thunar"))
      hl.bind(mod .. " + M", hl.dsp.exit())
      hl.bind(mod .. " + B", hl.dsp.exec_cmd("brave"))
      for i = 1, 10 do
        local key = tostring(i % 10)
        hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
        hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
      end
      hl.on("hyprland.start", function()
        hl.exec_cmd("waybar")
        hl.exec_cmd("mako")
      end)
    '';
  };
  home.packages = with pkgs; [ thunar wl-clipboard grim slurp ];
}
