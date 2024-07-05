{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
    	"python-2.7.18.8" 
	"electron-25.9.0" 
	#"yandex-browser-stable-24.4.1.915-1"
    ];
  };

   environment.systemPackages = with pkgs; [
 	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	git
	home-manager
	
	bspwm
	polybar
	sxhkd
	lightdm
	rofi
	alacritty
	dunst
	mako
	picom
	nitrogen
	fish
	#thunar
	xfce.thunar
	btop
	feh

#	cc
	gcc
	clang
	cl
	zig

	# wayland
	#sww
	waybar
	rofi-wayland

	neofetch
	ranger

	neovim
	eza
	firefox
	#yandex-browser
	telegram-desktop
	zathura
	spotify

	flameshot

	bluez
	bluez-tools

	pipewire
    	pulseaudio
	#alsa
   ];
}
