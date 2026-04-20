# Magisk vs KernelSU — Detailed Comparison

## Philosophy

**Magisk**: Userspace root solution. Patches the boot.img, runs as a daemon in init.rc.

**KernelSU**: Kernel-level root. Patches kernel module, intercepts syscalls before userspace sees them.

## Detection & Hiding

### Magisk

**Artifacts (without Shamiko):**
- `/sbin/su` exists
- `/data/adb/magisk` folder
- Magisk processes in `ps`

**With Shamiko + Zygisk:**
- Very hard to detect
- Root can be hidden per-app via DenyList
- SELinux-aware hiding

**Banking apps:** PlayIntegrityFix + TrickyStore usually pass

### KernelSU

**No userspace artifacts:**
- No `/sbin/su` binary on disk
- No Magisk folder
- No processes to detect

**Detection method:** Apps must hook syscalls at kernel level (very advanced)

**Banking apps:** Native evasion is better, but no full ecosystem yet

## Module Ecosystem

### Magisk
- **2000+ modules** on official repo
- **LSPosed support** (Xposed hooks)
- **Shamiko** (root hiding)
- **PlayIntegrityFix** (attestation spoofing)
- **Well-tested** (mature, 2015-present)

### KernelSU
- **100+ modules** (growing)
- **ZygiskNext** for Zygisk support
- **Module ecosystem smaller** but developing
- **Web UI modules** (unique feature)

## Performance

### Magisk
- Small daemon overhead
- Negligible on modern devices
- Boot time: +200ms

### KernelSU
- Kernel patch, always active
- Slightly more efficient
- Boot time: +100ms

## Compatibility

### Magisk
- Works on **all devices** with custom recovery
- Survives OTA (can re-patch)
- Doesn't require kernel source

### KernelSU
- Requires **GKI kernel** (Android 12+, most Pixels, modern Xiaomis)
- Needs kernel recompilation for non-GKI
- Better on flagship devices

## Use Case Recommendations

### Choose **Magisk** if:
- Using older device (pre-Android 12)
- Need LSPosed / large module ecosystem
- Want maximum app compatibility
- Banking app matters

### Choose **KernelSU** if:
- Device has GKI kernel (Pixel 6+, most flagships 2022+)
- Privacy is paramount (harder to detect)
- Want lighter footprint
- Don't need LSPosed

### Choose **Neither** if:
- Device has no custom recovery support
- ROM is locked bootloader (not possible to unlock)
- Don't actually need root
