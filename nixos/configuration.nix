# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./boot.nix
#      ./all-packages.nix
      ./fonts.nix
    ];

  # Use the systemd-boot EFI boot loader.
#  boot.loader.systemd-boot.enable = true;
#  boot.loader = {
#  grub = {
#    enable = true;
#    useOSProber = true;
#    devices = [ "nodev" ];
#    efiSupport = true;
#    configurationLimit = 5;
#  };
#  efi.canTouchEfiVariables = true;
#};


#  boot.loader.grub.enable = true;
#  boot.loader.grub.version = 2;
#  boot.loader.grub.devices = [ "/dev/nvme0n1" ];
#  boot.loader.grub.devices = [ "nodev" ];
#  boot.loader.systemd-boot.enable = false; # Отключаем systemd-boot

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  
  nix.settings.experimental-features = "nix-command flakes";

#  services.xserver = {
#	enable = true;
#	desktopManager = {
#	xfce.enable = true;
#  };
#  	displayManager.defaultSession = "xfce";
#  };


services.xserver = {
		enable = true;
		layout = "us,ru";
#		xkbOptions = "eurosign:e";
	  desktopManager.xfce = {
# change to true	enable = false;
			enableXfwm = false;
		};
	windowManager.bspwm.enable = true;
	#windowManager.bspwm.package = "pkgs.bspwm-unstable";
	#windowManager.default = "bspwm";
  	displayManager.defaultSession = "none+bspwm";
	windowManager.bspwm.configFile = "/home/slava/.config/bspwm/bspwmrc";
	windowManager.bspwm.sxhkd.configFile= "/home/slava/.config/sxhkd/sxhkdrc";
	desktopManager.xterm.enable = false;

	displayManager.lightdm = {
      		enable = true;
      		#autoLogin.enable = true;
		#autoLogin.user = "slava";
	};
		#displayManager.auto = {
		#	enable = true;
		#	user = "user";
		#};
};
  services.xrdp.defaultWindowManager = "bspwm";
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  #bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.disableWhileTyping = true;



  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.slava = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "input" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };
  
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = [
    pkgs.fish
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

