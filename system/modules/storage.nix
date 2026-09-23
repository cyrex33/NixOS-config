{
   boot.supportedFilesystems = [ "ntfs" ];

   fileSystems."/mnt/storage" = {
       device = "/dev/sda3";
       fsType = "ext4";
       options = [ "defaults" "nofail" "exec" ];
 };
}
