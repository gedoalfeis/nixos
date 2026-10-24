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

 programs.fzf.enableBashIntegration = true;

 programs.bash = {
   enable = true;
   shellAliases = {
   	 list = "ls -AFoqvh --time-style long-iso --group-directories-first";
     nixgit = "tput setaf 5; echo -e push changes to github ... \\\n; tput sgr0; cd $HOME/.nixos && git commit -a -m \"automatic commit through nixgit\" && git push origin main";
   	 nixtest = "tput setaf 5; echo -e nixos-rebuild dry-activate ... \\\n; tput sgr0; cd $HOME/.nixos && sudo nixos-rebuild dry-activate";
   	 nixrebuild = "tput setaf 5; echo -e nixos-rebuild switch ... \\\n; tput sgr0; cd $HOME/.nixos && sudo nixos-rebuild switch";
   	 nixupdate = "tput setaf 5; echo -e nix flake update AND nixos-rebuild boot ... \\\n; tput sgr0; cd $HOME/.nixos && nix flake update && sudo nixos-rebuild boot && tput setaf 5 && echo -e Bitte neu starten.";
   	 nixverify = "tput setaf 5; echo -e nix-store --verify --check-contents ... \\\n; tput sgr0; cd $HOME/.nixos && sudo nix-store --verify --check-contents";   	 
   };
 };

}
