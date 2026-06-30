### AnyKernel3 Ramdisk Mod Script
### lavender (Redmi Note 7 / SDM660) - A-only device

properties() { '
kernel.string=C9 Custom Kernel for Redmi Note 7 (lavender)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lavender
device.name2=Lavender
device.name3=LAVENDER
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

## AnyKernel install
. tools/ak3-core.sh;

# Banner (MUST be after ak3-core.sh is sourced)
ui_print " ";
ui_print "**************************************";
ui_print "*  C9 Custom Kernel for Lavender     *";
ui_print "*  Codename: Blitz                   *";
ui_print "*  Built by JorianPonomaref          *";
ui_print "*  Base: Linux 4.4.x + KSUN + CID   *";
ui_print "*  Source: kucingoranye SDM660       *";
ui_print "**************************************";
ui_print " ";

split_boot;

flash_boot;
## end install
