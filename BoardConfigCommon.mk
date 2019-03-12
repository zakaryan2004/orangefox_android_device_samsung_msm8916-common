#
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/msm8916-common

# Includes
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Inherit from common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Architecture/platform
BOARD_VENDOR := samsung
FORCE_32_BIT := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU       := qcom-adreno306
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_CORTEX_A53 := true
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a53
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bootloader
BOARD_PROVIDES_BOOTLOADER_MESSAGE := false
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_HAVE_NEW_GRALLOC := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_NEW_ION_API := true

# Encryption
TARGET_LEGACY_HW_DISK_ENCRYPTION := true
TARGET_HW_KEYMASTER_V03 := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

ifeq ($(RECOVERY_VARIANT),twrp)
	TARGET_HW_DISK_ENCRYPTION := false
	TARGET_SWV8_DISK_ENCRYPTION := false
else
	TARGET_HW_DISK_ENCRYPTION := true
	TARGET_SWV8_DISK_ENCRYPTION := true
endif

# Filesystems
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE    := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Kernel
BOARD_KERNEL_CMDLINE += \
	console=null \
	androidboot.hardware=qcom \
	user_debug=23 \
	msm_rtb.filter=0x3F \
	ehci-hcd.park=3 \
	androidboot.bootdevice=7824900.sdhci \
	androidboot.selinux=permissive

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
LZMA_RAMDISK_TARGETS := recovery
TARGET_KERNEL_CONFIG := msm8916_sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_SELINUX_LOG_CONFIG := selinux_log_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/msm8916

# Kernel - Toolchain
ifneq ($(wildcard $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-7.2/bin),)
    KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-7.2/bin
    KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
endif


# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE      := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 15728640
BOARD_CACHEIMAGE_PARTITION_SIZE     := 314572800
BOARD_FLASH_BLOCK_SIZE              := 131072

# Qualcomm support
TARGET_USES_QCOM_BSP := true
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE   := true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true
TARGET_USES_NEW_ION_API := true

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/msm8916-common/recovery/recovery_keys.c
BOARD_HAS_NO_MISC_PARTITION	:= true
BOARD_HAS_NO_SELECT_BUTTON	:= true
BOARD_RECOVERY_SWIPE 		:= true
BOARD_SUPPRESS_EMMC_WIPE	:= true
BOARD_SUPPRESS_SECURE_ERASE	:= true
BOARD_USE_CUSTOM_RECOVERY_FONT	:= \"roboto_23x41.h\"
BOARD_USES_MMCUTILS	:= true
RECOVERY_GRAPHICS_USE_LINELENGTH	:= true
RECOVERY_SDCARD_ON_DATA	:= true
TARGET_RECOVERY_DENSITY	:= hdpi
TARGET_RECOVERY_FSTAB	:= device/samsung/msm8916-common/recovery/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT	:= "RGB_565"
TARGET_RECOVERY_QCOM_RTC_FIX	:= true

# Recovery - TWRP
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_HAS_DOWNLOAD_MODE := true
TW_HAS_MTP := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "accelerometer\x0ahbtp_vm"
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_MAX_BRIGHTNESS := 255
TW_MTP_DEVICE := /dev/mtp_usb
TW_NEW_ION_HEAP := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_USB_STORAGE := true
TW_TARGET_USES_QCOM_BSP := false
TW_THEME := portrait_hdpi
TW_EXCLUDE_SUPERSU := true


ifeq ($(RECOVERY_VARIANT),twrp)
	BOARD_GLOBAL_CFLAGS += -DTW_USE_MINUI_CUSTOM_FONTS
endif

#ifneq ($(wildcard bootable/recovery-twrp),)
#	RECOVERY_VARIANT := twrp
#endif

# SELinux
include device/qcom/sepolicy/sepolicy.mk
include device/qcom/sepolicy/legacy-sepolicy.mk

BOARD_SEPOLICY_DIRS += \
   $(LOCAL_PATH)/sepolicy