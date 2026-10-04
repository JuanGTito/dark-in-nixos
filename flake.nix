{
    description = "Nixos configuration";

    inputs = {
        # Keep NixOS and Home Manager on compatible rolling branches.
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = { self, nixpkgs, home-manager, ... }:
        let 
            system = "x86_64-linux";
	in
	{
            nixosConfigurations.main = nixpkgs.lib.nixosSystem {
                inherit system;

                modules = [
                    ./hosts/main/configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.backupFileExtension = "hm-backup-20261003";
                        home-manager.users.johnt = 
			    import ./home/johnt/home.nix;
                    }
                ];
            };
        };
}
