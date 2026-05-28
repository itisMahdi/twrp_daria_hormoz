#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/daria/hormoz

# Hidl Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH) 

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# API
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 34

# A/B
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true
AB_OTA_PARTITIONS += \
    apusys \
    audio_dsp \
    boot \
    ccu \
    connsys_bt \
    connsys_gnss \
    connsys_wifi \
    dpm \
    dtbo \
    gpueb \
    gz \
    init_boot \
    lk \
    logo \
    mcf_ota \
    mcupm \
    modem \
    mvpu_algo \
    odm_dlkm \
    pi_img \
    preloader \
    product \
    scp \
    spmfw \
    sspm \
    system \
    system_dlkm \
    system_ext \
    tee \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vcp \
    vendor \
    vendor_boot \
    vendor_dlkm 
    
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery 

PRODUCT_PACKAGES := \
    bootctrl.mt6897 \
    libgptutils \
    libz \
    libcutils \

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload \
    checkpoint_gc

# Drm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Additional Target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2 \
    android.hardware.keymaster@4.1

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
