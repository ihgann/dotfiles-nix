# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
    networking.hostName = "laptop";

    environment.systemPackages = with pkgs; [
        powertop acpi upower tlp
    ];

    networking.extraHosts = let
    hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts;
    hostsFile = builtins.fetchurl { url=hostsPath; sha256="sha256:0k2530ws62pnwf2gfxsc2yca1b1wiz4696051aajkjcd4m5z7hi0"; };
    in builtins.readFile "${hostsFile}";

    hardware.cpu.intel.updateMicrocode = true;

    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "rtsx_pci_sdmmc" ];

    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/74c98363-e127-4b3b-9840-6bfb32837807";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/99CC-4342";
        fsType = "vfat";
    };

    swapDevices = [ { device = "/dev/disk/by-uuid/ccec80c0-6886-4534-899c-04a3a00e88b5"; } ];

    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
