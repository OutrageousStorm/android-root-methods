# Root Methods Comparison

| Method | Requires Flashing | Hides from Apps | GMS/Banking | Battery | Complexity | Best For |
|--------|-------------------|-----------------|------------|---------|------------|----------|
| **Magisk** | Boot.img | Via Shamiko | Good | Good | Medium | Daily driver, modules |
| **KernelSU** | Custom kernel | Inherent | Better | Good | High | Kernel-level hiding |
| **Superuser (old)** | System patch | Poor | Poor | N/A | Low | Legacy, simple |
| **Shizuku** | USB only | N/A (not root) | Excellent | Excellent | Low | No-root power user |

## Decision tree

```
Do you want root?
├─ NO → Use Shizuku (USB ADB access, no root needed)
├─ YES → Can you flash custom ROM?
│   ├─ NO → Not possible on locked devices
│   └─ YES → Pick: Magisk (modules) or KernelSU (kernel-level)
└─ Legacy device → Superuser (if available for your kernel)
```

## When to use each

**Magisk**: Best for most users. Works with Zygisk modules, has huge ecosystem, survives OTAs.

**KernelSU**: If you need kernel-level root or want superior app detection evasion.

**Shizuku**: No flashing needed, works immediately, can't run actual root commands but grants shell-like access.

**SuperUser**: Only if stuck on very old Android with kernel source available.
