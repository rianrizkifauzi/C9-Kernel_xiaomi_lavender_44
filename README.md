# C9 Kernel Builder · Xiaomi Redmi Note 7 (Lavender / 4.4)

[![Build C9 Kernel KSUN (Lavender 4.4)](https://github.com/rianrizkifauzi/C9-Kernel_xiaomi_lavender_44/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/rianrizkifauzi/C9-Kernel_xiaomi_lavender_44/actions/workflows/build.yml)

Automated GitHub Actions builder untuk **C9 Custom Kernel** — Linux 4.4.x untuk **Xiaomi Redmi Note 7** (Lavender / SDM660) dengan KernelSU-Next root integration.

> **Download:** [C9-Kernel_releases](https://github.com/rianrizkifauzi/C9-Kernel_releases)
> **Changelog:** [CHANGELOG.md](CHANGELOG.md)

---

## Specs

| Field | Value |
|---|---|
| Codename | `Phoenix` |
| Version | `R1.0` |
| Device | Xiaomi Redmi Note 7 (lavender) |
| SoC | Qualcomm SDM660 |
| Boot type | A-only (single boot partition) |
| Kernel | Linux 4.4.x (San-Kernel lineage) |
| Base source | [kucingoranye/android_kernel_xiaomi_sdm660_44](https://github.com/kucingoranye/android_kernel_xiaomi_sdm660_44) `manual-hook-rksu-ksun` |
| Toolchain | [Proton Clang](https://github.com/kdrag0n/proton-clang) |
| Linker | GNU ld (ld.lld unstable on 4.4) |
| Root | KernelSU-Next legacy branch |
| KSU_VERSION | 33129 |
| Hooks | Pre-patched manual hook in source branch (rebased from [kucingoranye/kernel_patches](https://github.com/kucingoranye/kernel_patches) kernel-4.4_4.9) |

---

## Hook integration

The `manual-hook-rksu-ksun` source branch already ships the manual KSU hooks + `path_umount` backport pre-patched. The builder detects the existing hooks (`hook_strategy=none`) and only clones the KernelSU-Next driver on top — no double-patching.

| File | Hook | Purpose |
|---|---|---|
| `fs/exec.c` | `ksu_handle_execveat` | Intercept exec syscall (su detection) |
| `fs/stat.c` | `ksu_handle_stat` | vfs_stat hook (path hiding base) |
| `fs/open.c` | `ksu_handle_faccessat` | faccessat hook |
| `fs/read_write.c` | `ksu_handle_vfs_read` | vfs_read hook |
| `kernel/reboot.c` | `ksu_handle_sys_reboot` | sys_reboot hook (KSUN requirement) |
| `security/selinux/hooks.c` | `is_ksu_transition` | NNP/nosuid bypass for ksud spawn |

KernelSU driver is cloned via the official setup script:

```sh
curl -LSs "https://raw.githubusercontent.com/KernelSU-Next/KernelSU-Next/next/kernel/setup.sh" | bash -s legacy
```

---

## Trigger build

### From GitHub UI

1. Tab **[Actions](../../actions/workflows/build.yml)**
2. Klik **Run workflow**
3. Defaults sudah work untuk lavender 4.4 + manual-hook-rksu-ksun — tinggal `Run workflow`
4. Tunggu ~10-15 menit
5. Download zip dari [releases repo](https://github.com/rianrizkifauzi/C9-Kernel_releases/releases)

### Customize build

| Input | Default | Description |
|---|---|---|
| `kernel_repo` | `kucingoranye/android_kernel_xiaomi_sdm660_44` | Source kernel repo |
| `kernel_branch` | `manual-hook-rksu-ksun` | Pre-patched manual hook branch |
| `kernel_commit` | `head` | Pin commit |
| `defconfig` | `lavender_defconfig` | Lavender-specific |
| `ksun_repo` | `KernelSU-Next/KernelSU-Next` | KSU implementation |
| `ksun_branch` | `legacy` | KSU branch (legacy = stable 3.x for non-GKI 4.x) |
| `hook_strategy` | `none` | Source already pre-patched — no extra injection |
| `pre_patched_kernel` | `false` | Hooks pre-patched but KSU driver still needs cloning |
| `use_llvm_linker` | `false` | MUST be false on 4.4 (GNU ld) |
| `enable_susfs` | `false` | Enable SUSFS patches |
| `kernel_codename` | `Phoenix` | San-style codename branding |
| `kernel_relver` | `R1.0` | San-style release version |

---

## Output naming (San-Kernel style)

Format zip: `C9-Kernel-<Codename>-<RelVer>-<DeviceLabel>-KSUN.zip`

Example: `C9-Kernel-Phoenix-R1.0-Lavender-KSUN.zip`

Release tag: `<codename>-<relver>-<device>` (e.g. `Phoenix-R1.0-lavender`)
Release name: `C9-Kernel-<Codename>-<RelVer>-<DeviceLabel>-4.4`

---

## Installation

Lavender adalah **A-only device** (bukan A/B kayak Daisy) — flash kernel zip langsung kerja di slot tunggal.

1. Boot ke **OFOX / TWRP recovery**
2. **Backup boot.img** dulu (Backup → Boot)
3. **Install** → pilih `C9-Kernel-Phoenix-R1.0-Lavender-KSUN.zip` → swipe
4. Reboot → System
5. Buka **KernelSU-Next Manager** → konfirmasi "Working"

---

## Compatible ROM

Tested base: ROM Android 9/10/11 yang share kernel 4.4 base dari San-Kernel SDM660 lineage. Backup boot.img sebelum flash.

---

## Credits

- **user-why-red / kucingoranye** ([android_kernel_xiaomi_sdm660_44](https://github.com/kucingoranye/android_kernel_xiaomi_sdm660_44)) — base kernel source / San-Kernel 4.4
- **KernelSU-Next** ([upstream](https://github.com/KernelSU-Next/KernelSU-Next))
- **kucingoranye** ([kernel_patches](https://github.com/kucingoranye/kernel_patches)) — manual hook + path_umount backport
- **backslashxx** — path_umount backport
- **kdrag0n** ([proton-clang](https://github.com/kdrag0n/proton-clang))
- **AnyKernel3** ([osm0sis](https://github.com/osm0sis/AnyKernel3))

Built by **JorianPonomaref**.

---

## License

Build scripts under MIT. Kernel source under **GPL-2.0** (inherited from upstream).
