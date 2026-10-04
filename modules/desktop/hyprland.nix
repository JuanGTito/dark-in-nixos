{ ... }:

{
    # SDDM uses X11 for its greeter; the desktop session is still Hyprland/Wayland.
    services.xserver.enable = true;

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    services.displayManager = {
        autoLogin.enable = false;

        sddm = {
            enable = true;

            # This controls only the greeter; Hyprland remains on Wayland.
            # X11 avoids input/rendering issues in SDDM's Wayland greeter.
            wayland.enable = false;

            settings.General = {
                RememberLastSession = true;
                RememberLastUser = true;
            };
        };
    };

    hardware.graphics.enable = true;
}
