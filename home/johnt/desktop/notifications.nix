{ ... }: {
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      border-radius = 15;
      border-size = 2;
      padding = "10";
      font = "JetBrainsMono Nerd Font 12";
      background-color = "#24273a";
      text-color = "#cad3f5";
      border-color = "#8aadf4";
      progress-color = "over #363a4f";
      "urgency=high".border-color = "#f5a97f";
    };
  };
}
