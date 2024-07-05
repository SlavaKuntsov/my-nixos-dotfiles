
set -U fish_user_paths ~/.bin ~/.local/bin

# Fish Dracula theme colours
set -x COMMENT 6272a4
set -x CYAN 8be9fd
set -x GREEN 50fa7b
set -x ORANGE ffb86c
set -x PINK ff79c6
set -x PURPLE bd93f9
set -x RED ff5555
set -x YELLOW f1fa8c

# Fish Dracula Theme Setup
set -U fish_color_autosuggestion $COMMENT
set -U fish_color_command $PINK
set -U fish_color_comment $COMMENT
set -U fish_color_cwd $CYAN
set -U fish_color_cwd_root $RED
set -U fish_color_end normal
set -U fish_color_error $RED
set -U fish_color_escape $CYAN
set -U fish_color_history_current $CYAN
set -U fish_color_host normal
set -U fish_color_match $GREEN
set -U fish_color_normal normal
set -U fish_color_operator $CYAN
set -U fish_color_param normal
set -U fish_color_quote $YELLOW
set -U fish_color_redirection $PURPLE
set -U fish_color_search_match \x2d\x2dbackground\x3d$PURPLE
set -U fish_color_selection \x2d\x2dbackground\x3d$PURPLE
set -U fish_color_user $PURPLE
set -U fish_color_valid_path \x2d\x2dunderline

set fish_greeting


# Create aliases
alias cls="clear"
alias g="git"
alias v="nvim"
alias m="micro"
alias tree="eza --tree -L 3"
alias l="exa  --long --no-user --no-permissions --no-time --no-filesize --icons"
alias ll="exa  --long --no-user --no-permissions --no-time --no-filesize --icons -all"
alias lsa="exa --grid --no-user --no-permissions --no-time --no-filesize --icons -all"
alias ls="exa --grid --no-user --no-permissions --no-time --no-filesize --icons"
alias ..="cd .."
alias ...="cd ../.."
alias cfg="cd ~/.config; ls"
alias nix="cd /etc/nixos/; ls"
alias rebuild="sudo nixos-rebuild switch"

# TODO: Replace journal aliases after switching to OpenRC

# Display critical errors
alias syslog_emerg="sudo dmesg --level=emerg,alert,crit"

# Output common errors
alias syslog="sudo dmesg --level=err,warn"

# Print logs from x server
alias xlog='grep "(EE)\|(WW)\|error\|failed" ~/.local/share/xorg/Xorg.0.log'

# Remove archived journal files until the disk space they use falls below 100M
alias vacuum="journalctl --vacuum-size=100M"

# Make all journal files contain no data older than 2 weeks
alias vacuum_time="journalctl --vacuum-time=2weeks"

#set -U fish_greeting
#set fish_color_command green
#set -gx EDITOR micro
#set -gx VISUAL micro
#set -gx BROWSER /usr/bin/firefox

alias sysclean 'sudo pacman -Rsn (pacman -Qdtq)'
alias sysupdate 'sudo reflector --verbose --country 'Germany' -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist; yay -Syyyu; sudo dkms autoinstall;sudo mkinitcpio -p linux-zen; sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias update-grub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'

neofetch

if status is-interactive
    # Commands to run in interactive sessions can go here
end
