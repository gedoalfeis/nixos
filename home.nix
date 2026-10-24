{ config, pkgs, ... }: {

  imports = [
  ];

  # Basic user info
  home.username = "gedo";
  home.homeDirectory = "/home/gedo";
  home.stateVersion = "26.05";

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  programs.git = {
  	enable = true;
  	settings = {
  		user.name = "gedoalfeis";
  		user.email = "gedo.alfeis@gmx.de";
  	};
  };

}
