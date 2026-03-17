{ ... }:
{
  home.file.".config/hypr" = {
    source = builtins.path {
      name = "hypr_config";
      path = ./hypr;
    };
  };
}
