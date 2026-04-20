# Android Root Methods Comparison

| Method | Root Type | Apps Affected | Detection Resistance | Ease | OTA Survival | Notes |
|--------|-----------|---------------|----------------------|------|-------------|-------|
| **Magisk** | Systemless | Minimal (DenyList) | Moderate (Shamiko+Zygisk) | Easy | Yes | Most popular, great module system |
| **KernelSU** | Kernel-level | Fewer (kernel grants) | High (kernel-native) | Medium | Native | Modern alternative, fewer userspace artifacts |
| **SuperSU** | Traditional | All | Low | Easy | No | Legacy, discontinued but still works |
| **Phh's SuperUser** | Traditional | All | Low | Easy | No | Old, unmaintained |
| **su binary** | Manual | All | Very Low | Hard | No | Raw root — not for daily use |
| **Rooted ROM** (LineageOS) | Integrated | Configurable | Depends | Easy | Yes | Root baked into ROM, no modules |

## Decision Tree

```
Do you need root?
├─ YES, daily driver
│  ├─ Want modules/tweaks? → Magisk
│  ├─ Maximum evasion? → KernelSU + ZygiskNext
│  └─ Custom ROM anyway? → LineageOS with built-in root
├─ YES, one-time task
│  └─ Use Shizuku (adb shell, no root needed!)
└─ NO → Stay unrooted for better security
```

## Root Detection Status (2026)

| Check | Magisk + Shamiko | KernelSU + PlayIntegrityFix | Stock |
|-------|------------------|------------------------------|-------|
| Banking apps | ✅ Passes | ✅ Passes | ✅ Passes |
| Play Integrity | ✅ With fix | ✅ With fix | ✅ Passes |
| File checks | ✅ Blocked | ✅ Blocked | ❌ Detects |
| Process checks | ✅ Blocked | ✅ Blocked | ❌ Detects |
| Build props | ✅ Spoofed | ✅ Spoofed | ❌ Test-keys |

## Installation paths

### Quickest: Magisk via boot.img patching
1. Download Magisk APK
2. Patch your ROM's boot.img in the app
3. Flash patched image: `fastboot flash boot magisk_patched.img`

### Most reliable: KernelSU (Android 12+ GKI devices only)
1. Check device uses GKI kernel: `cat /proc/version | grep gki`
2. Download KernelSU boot.img for your device
3. Flash: `fastboot flash boot kernelsu-boot.img`

### Least hassle: LineageOS + built-in sudo
LineageOS includes optional root grant to trusted apps. No modules, just sudo-style elevation.
