{ ... }: {
  programs.wofi = {
    enable = true;
    settings = { show = "drun"; width = 500; height = 400; prompt = "Buscar"; allow_images = true; insensitive = true; };
    style = builtins.readFile ./assets/wofi.css;
  };
}
