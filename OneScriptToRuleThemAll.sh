#!/bin/bash
# Install the kernel source for L4T
sudo ./scripts/getKernelSources.sh
sudo ./scripts/fixMakeFiles.sh
sudo ./scripts/makeKernel.sh
sudo ./scripts/copyImage.sh
