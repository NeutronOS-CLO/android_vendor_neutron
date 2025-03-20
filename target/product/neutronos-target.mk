# Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)
$(warning "Snapdragon Clang configuration included")

include vendor/neutron/build/tasks/macros.mk
include vendor/neutron/configs/BoardConfigNeutron.mk

# NeutronOS SEPolicy
$(call inherit-product, vendor/neutron/sepolicy/sepolicy.mk)

# AOSP Dialer
PRODUCT_PACKAGES += \
    Dialer

# Datura - Firewall
PRODUCT_PACKAGES += \
    Datura

# microG
PRODUCT_PACKAGES += \
    GmsCore \
    GsfProxy \
    FakeStore

# Enable support for APEX updates
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Paranoid Sense
PRODUCT_PACKAGES += \
    ParanoidSense

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml

# Enable Sense service for 64-bit only
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=$(TARGET_SUPPORTS_64_BIT_APPS)

# TouchGestures
PRODUCT_PACKAGES += \
    TouchGestures

# GameSpace
PRODUCT_PACKAGES += \
    GameSpace

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    resize2fs \
    tune2fs \
    e2fsck.recovery \
    resize2fs.recovery \
    tune2fs.recovery

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect_system \
    libqti_vndfwk_detect_vendor \
    libvndfwk_detect_jni.qti_system \
    libvndfwk_detect_jni.qti_vendor \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Protobuf - Workaround for prebuilt Qualcomm HAL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# Dex2oat
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client

PRODUCT_VENDOR_MOVE_ENABLED := true

# Telephony - CLO
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml

ifneq ($(TARGET_NO_TELEPHONY), true)
PRODUCT_PACKAGES += \
    tcmiface \
    telephony-ext \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml

# Telephony - AOSP
PRODUCT_PACKAGES += \
    Stk

PRODUCT_BOOT_JARS += \
    tcmiface \
    telephony-ext
endif

# Miscellaneous
PRODUCT_PACKAGES += \
    libcurl.vendor \
    libjsoncpp.vendor \
    libsqlite.vendor \
    libdumpstateutil.vendor \
    libpng.vendor \
    libdumpstateutil.vendor \
