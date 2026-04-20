# 🔓 Android Root Methods

Decision tree and comparison of modern Android root solutions.

## Quick Decision Tree

```
Do you have a custom kernel?
├─ YES → Use KernelSU (easiest, no separate install)
└─ NO → Do you want OTA survival?
    ├─ YES → Use Magisk with boot.img patching
    └─ NO → Use Magisk (standard)

Need Zygisk/LSPosed?
├─ YES → Magisk + Zygisk is mature choice
└─ NO → KernelSU is lighter, faster

Using a banking app?
├─ YES → Magisk + PlayIntegrityFix + Shamiko
└─ NO → Either method works
```

## Methods at a Glance

| Method | Setup | Detection | Modules | OTA | Best for |
|--------|-------|-----------|---------|-----|----------|
| **Magisk** | Boot.img patch | Hard (with Shamiko) | 2000+ | Yes | Traditional choice |
| **KernelSU** | Kernel patch | Harder (no artifacts) | Growing | Yes | Privacy-focused |
| **Manual su** | Flash su binary | Easy | N/A | No | Old devices |
| **SuperSU** | Boot.img patch | Easy | Limited | No | Legacy (deprecated) |

## Detailed Comparison

See individual documents:
- [magisk-vs-kernelsu.md](docs/magisk-vs-kernelsu.md)
- [magisk-setup.md](docs/magisk-setup.md)
- [kernelsu-setup.md](docs/kernelsu-setup.md)
