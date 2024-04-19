# Copyright (C) 2014 The CyanogenMod Project
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

# Inherit from the proprietary version
-include vendor/samsung/j3xnlte/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := sc8830
TARGET_BOARD_PLATFORM_GPU := mali-400
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := SC9830I
BOARD_VENDOR := samsung

# Config u-boot
TARGET_NO_BOOTLOADER := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5272240128
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := j3xnlte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/j3xnlte
#NEED_KERNEL_MODULE_ROOT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt device/samsung/j3xnlte/dt.img

# SPRD_MODULES:
#	make -C vendor/sprd/modules/libgpu/gpu/utgard/ MALI_PLATFORM=sc8830 BUILD=debug KDIR=$(KERNEL_OUT) clean
#	make -C vendor/sprd/modules/libgpu/gpu/utgard/ MALI_PLATFORM=sc8830 BUILD=debug KDIR=$(KERNEL_OUT)
#	mv vendor/sprd/modules/libgpu/gpu/utgard/mali.ko $(KERNEL_MODULES_OUT)
#	make -C vendor/sprd/wcn/wifi/sc2331/5.1/ SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=debug KDIR=$(KERNEL_OUT) clean
#	make -C vendor/sprd/wcn/wifi/sc2331/5.1/ SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=debug KDIR=$(KERNEL_OUT)
#	mv vendor/sprd/wcn/wifi/sc2331/5.1/sprdwl.ko $(KERNEL_MODULES_OUT)
#	mkdir -p $(PRODUCT_OUT)/system/lib/modules
#	ln -sf /lib/modules/autotst.ko $(PRODUCT_OUT)/system/lib/modules/autotst.ko
#	ln -sf /lib/modules/mali.ko $(PRODUCT_OUT)/system/lib/modules/mali.ko
#	ln -sf /lib/modules/mmc_test.ko $(PRODUCT_OUT)/system/lib/modules/mmc_test.ko
#	ln -sf /lib/modules/sprdwl.ko $(PRODUCT_OUT)/system/lib/modules/sprdwl.ko
#
#TARGET_KERNEL_MODULES := SPRD_MODULES

# RIL
BOARD_RIL_CLASS := ../../device/samsung/j3xnlte/ril

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/j3xnlte/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/j3xnlte/bluetooth/libbt_vndcfg.txt

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_WLAN_DEVICE           := sc2341
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/fwpath"
WIFI_DRIVER_FW_PATH_STA     := "sta_mode"
WIFI_DRIVER_FW_PATH_P2P     := "p2p_mode"
WIFI_DRIVER_FW_PATH_AP      := "ap_mode"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/sprdwl.ko"
WIFI_DRIVER_MODULE_NAME     := "sprdwl"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true

# Hardware rendering
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
HWUI_COMPILE_FOR_PERF := true
USE_OPENGL_RENDERER := true
COMMON_GLOBAL_CFLAGS += -DSC8830_HWC

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Resolution
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Audio
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_SS_VOIP := true
BOARD_USE_LIBATCHANNEL_WRAPPER := true

# Board specific features
BOARD_USE_SAMSUNG_COLORFORMAT := true
COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# Init
TARGET_NR_SVC_SUPP_GIDS := 24
TARGET_PROVIDES_INIT_RC := true

# Recovery
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Assert
TARGET_OTA_ASSERT_DEVICE := SM-J320FN,SM-J320F,SM-J210F,j3xnltexx,j3xnlte,j2xlte,j3xltexx,j3xlte

# Use dmalloc() for such low memory devices like us
MALLOC_IMPL := dlmalloc

# Use prebuilt webviewchromium to cut down build time
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# Enable dex-preoptimization to speed up the first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true
WITH_DEXPREOPT_COMP := false

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/j3xnlte/cmhw/

# TWRP
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/platform/sec-thermistor/temperature"
TARGET_RECOVERY_FSTAB := device/samsung/j3xnlte/ramdisk/fstab.sc8830
TW_HAS_DOWNLOAD_MODE := true
DEVICE_RESOLUTION := 720x1280
TW_THEME := portrait_hdpi

# UMS
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
