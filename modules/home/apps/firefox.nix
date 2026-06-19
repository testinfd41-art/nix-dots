{ config, lib, pkgs, ... }: {

    programs.firefox = {
      enable = true;
      policies.DisableTelemetry = true;
   };
}
