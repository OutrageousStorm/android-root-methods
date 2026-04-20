#!/bin/bash
# quick_reference.sh -- Quick reference for checking root status and methods
# Usage: ./quick_reference.sh

echo "🔓 Android Root Status Check"
echo "=============================="
echo ""

adb shell "
echo '[Root detection]'
which su && echo '  ✓ su found in PATH' || echo '  ✗ No su in PATH'

[[ -f /sbin/su ]] && echo '  ✓ /sbin/su exists' || echo '  ✗ /sbin/su not found'
[[ -f /system/xbin/su ]] && echo '  ✓ /system/xbin/su exists' || echo '  ✗ Not found'

echo ''
echo '[Magisk]'
[[ -d /data/adb/magisk ]] && echo '  ✓ Magisk installed' || echo '  ✗ Not installed'

echo ''
echo '[KernelSU]'
[[ -f /proc/version ]] && grep -q 'KernelSU' /proc/version && echo '  ✓ KernelSU kernel' || echo '  ✗ Not KernelSU'

echo ''
echo '[Shizuku]'
pm list packages | grep -q 'moe.shizuku' && echo '  ✓ Shizuku installed' || echo '  ✗ Not installed'

echo ''
echo '[Build]'
getprop ro.build.tags | grep -q 'test-keys' && echo '  ✓ test-keys (rooted ROM)' || echo '  ✓ release-keys (stock)'
"
