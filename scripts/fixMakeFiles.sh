#!/bin/bash
# Fix the Makefiles so that they compile on the device
echo "Patching devfreq for kernel..."
patch /usr/src/kernel/kernel-4.4/drivers/devfreq/Makefile ./diffs/devfreq/devfreq.patch
echo "Patching nvgpu for kernel..."
patch /usr/src/kernel/nvgpu/drivers/gpu/nvgpu/Makefile ./diffs/nvgpu/nvgpu.patch
echo "Patching tegra-alt for kernel..."
patch /usr/src/kernel/kernel-4.4/sound/soc/tegra-alt/Makefile ./diffs/tegra-alt/tegra-alt.patch

# Apply HDMI hotplug patch 
echo "Patching HDMI..."
patch /usr/src/kernel/display/drivers/video/tegra/dc/hdmi2.0.c ./diffs/realsense-camera-formats.patch

# Apply UVC formats patch for RealSense devices
echo "Patching RealSense camera formats..."
patch -p1 < ./diffs/realsense-camera-formats.patch

# vmipi is in a sub directory without a Makefile, there was an include problem
cp /usr/src/kernel/kernel-4.4/drivers/media/platform/tegra/mipical/mipi_cal.h /usr/src/kernel/kernel-4.4/drivers/media/platform/tegra/mipical/vmipi/mipi_cal.h
 
echo "Fixing Makefile and patches complete."

