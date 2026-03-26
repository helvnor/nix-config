{ ... }:
{
  # home.file.".config/hypr" = {
  #   source = builtins.path {
  #     name = "hypr_config";
  #     path = ./hypr;
  #   };
  # };
  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
    force = true;
  };
}
