C9-Kernel-linux version-4.4
Codename: Phoenix
Type: Stable

Changelog R1.0 :

_• First public release of C9-Kernel 4.4 for Xiaomi Redmi Note 7 (Lavender)._
_• Compiled using Proton Clang (kdrag0n) latest._
_• Linux 4.4.x San-Kernel SDM660 lineage (latest CLO/CIP-LTS tags merged)._
_• Base on kucingoranye/android_kernel_xiaomi_sdm660_44 @ manual-hook-rksu-ksun branch._
_• Source ships pre-patched manual KSU hooks + path_umount backport (rebased from kucingoranye/kernel_patches kernel-4.4_4.9)._
_• Integrate KernelSU-Next legacy as non-GKI root solution (cloned via official setup.sh)._
_• Force KSU_VERSION to 33129 to match Manager v3.2.0-spoofed bundled ksud._
_• Link with GNU ld (ld.lld produces empty built-in.o on 4.4)._
_• Add C9 branding: CONFIG_LOCALVERSION="-C9-Phoenix-KSUN-R1.0"._
_• Build identity: JorianPonomaref@lavender44-actions._
_• AnyKernel3 flashable zip with A-only device support._

Known Issues :

_• Shamiko module not supported (deprecated for KSU; use Zygisk Next built-in DenyList instead)._
_• SUSFS not enabled in this build by default._

Compatible ROM :

_• Android 9/10/11 ROMs yang share kernel 4.4 base dari San-Kernel SDM660 lineage._

Credits :

_• Base kernel by user-why-red / kucingoranye (San-Kernel 4.4)._
_• Toolchain by kdrag0n (Proton Clang)._
_• KernelSU-Next driver by KernelSU-Next/KernelSU-Next._
_• Hook patches by kucingoranye, path_umount backport by backslashxx._
_• AnyKernel3 by osm0sis._
