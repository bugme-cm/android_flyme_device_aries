#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10270720 14a3bf3c8db16de1653e032b4e9d3b1501f82352 7983104 fee3ec1ab4e523ad10b50d85a6c81e37b0b574d2
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10270720:14a3bf3c8db16de1653e032b4e9d3b1501f82352; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7983104:fee3ec1ab4e523ad10b50d85a6c81e37b0b574d2 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 14a3bf3c8db16de1653e032b4e9d3b1501f82352 10270720 fee3ec1ab4e523ad10b50d85a6c81e37b0b574d2:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
