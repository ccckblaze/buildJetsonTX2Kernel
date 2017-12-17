#!/bin/bash
# Fix the Makefiles so that they compile on the device
echo "Patching devfreq kernel..."
patch /usr/src/kernel/kernel-4.4/drivers/devfreq/Makefile ./diffs/devfreq/devfreq.patch
echo "Patching nvgpu kernel..."
patch /usr/src/kernel/nvgpu/drivers/gpu/nvgpu/Makefile ./diffs/nvgpu/nvgpu.patch
echo "Patching tegra-alt kernel..."
patch /usr/src/kernel/kernel-4.4/sound/soc/tegra-alt/Makefile ./diffs/tegra-alt/tegra-alt.patch
echo "Patching uvc_driver.c driver file..."
patch /usr/src/kernel/kernel-4.4/drivers/media/usb/uvc/uvc_driver.c ./diffs/uvc_driver_c.patch
echo "Patching uvcvideo.h driver file..."
patch /usr/src/kernel/kernel-4.4/drivers/media/usb/uvc/uvcvideo.h ./diffs/uvcvideo_h.patch
echo "Patching videodev2.h driver file..."
patch /usr/src/kernel/kernel-4.4/include/uapi/linux/videodev2.h ./diffs/videodev2_h.patch
# vmipi is in a sub directory without a Makefile, there was an include problem
cp /usr/src/kernel/kernel-4.4/drivers/media/platform/tegra/mipical/mipi_cal.h /usr/src/kernel/kernel-4.4/drivers/media/platform/tegra/mipical/vmipi/mipi_cal.h
 
echo "Fixing Makefile and patches complete."

