{
   boot.supportedFilesystems = [ "ntfs" ];

   fileSystems."/mnt/storage" = {
       device = "/dev/disk/by-uuid/3d336ff6-ad6a-4639-bba2-a9eb875fb692";
       fsType = "ext4";
       options = [ "defaults" "nofail" "exec" ];
 };
}
