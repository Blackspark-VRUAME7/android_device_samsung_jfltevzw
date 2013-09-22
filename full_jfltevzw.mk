# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
 
#
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#


# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from jfltevzw device
$(call inherit-product, device/samsung/jfltevzw/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_jfltevzw
PRODUCT_DEVICE := jfltevzw
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SCH-I545

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
    
# Prebuilt kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/modules/commkm.ko:system/lib/modules/commkm.ko \
    $(LOCAL_PATH)/modules/dhd.ko:system/lib/modules/dhd.ko \
    $(LOCAL_PATH)/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    $(LOCAL_PATH)/modules/evbug.ko:system/lib/modules/evbug.ko \
    $(LOCAL_PATH)/modules/exfat_core.ko:system/lib/modules/exfat_core.ko \
    $(LOCAL_PATH)/modules/exfat_fs.ko:system/lib/modules/exfat_fs.ko \
    $(LOCAL_PATH)/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    $(LOCAL_PATH)/modules/mcdrvmodule.ko:system/lib/modules/mcdrvmodule.ko \
    $(LOCAL_PATH)/modules/mckernelapi.ko:system/lib/modules/mckernelapi.ko \
    $(LOCAL_PATH)/modules/mmc_test.ko:system/lib/modules/mmc_test.ko \
    $(LOCAL_PATH)/modules/msm-buspm-dev.ko:system/lib/modules/msm-buspm-dev.ko \
    $(LOCAL_PATH)/modules/mvpkm.ko:system/lib/modules/mvpkm.ko \
    $(LOCAL_PATH)/modules/pvtcpkm.ko:system/lib/modules/pvtcpkm.ko \
    $(LOCAL_PATH)/modules/qce40.ko:system/lib/modules/qce40.ko \
    $(LOCAL_PATH)/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    $(LOCAL_PATH)/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    $(LOCAL_PATH)/modules/reset_modem.ko:system/lib/modules/reset_modem.ko \
    $(LOCAL_PATH)/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/modules/spidev.ko:system/lib/modules/spidev.ko \
    $(LOCAL_PATH)/modules/test-iosched.ko:system/lib/modules/test-iosched.ko \
    $(LOCAL_PATH)/modules/mali.ko:system/lib/modules/tima_debug_log.ko \
    $(LOCAL_PATH)/modules/vpnclient.ko:system/lib/modules/wlan.ko
