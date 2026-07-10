/*
  Syncthing

  General settings and devices are defined here.
  Host-specific settings are in the host files.
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    syncthing.enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf config.syncthing.enable {
    services.syncthing = {
      enable = true;
      overrideDevices = true;
      overrideFolders = true;
    };

    services.syncthing.settings.devices = {
      Radagast.id = "ODFOMSR-OYLBAYG-4PVAA3X-7HK4GLW-K6PJ2CE-DGUMOYB-NJMO7HY-CQ4ZOQC";
      Lenny.id = "WCVHWWW-AGFBO2D-ENYXE2K-ZNXIKXW-4MT2SK2-6VPUUHQ-CA2GONG-N4ZEUQE";
      Pixel7.id = "WELIXPL-T72SWIF-SYQDKWY-FHKYK7I-6F2BEII-QKN24K6-OQYDWAG-F3IG7QN";
      Roger.id = "H47XN3N-TOUOSGK-MV3CHFR-IPCJ6LU-6CA7LHO-KTFH5DC-OY2JWIT-TYVJOAN";
      NixBerry.id = "TCM7RR5-MROHSFX-NKZK7SI-MWTT25M-MOBEG4L-LQ4VRIG-GD7QCED-F25XIAB";
    };
  };
}
