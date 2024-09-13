{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    idea-ultimate
  ];
}
