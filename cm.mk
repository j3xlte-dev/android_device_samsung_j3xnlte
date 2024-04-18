## Specify phone tech before including full_phone	
$(call inherit-product, vendor/cm/config/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := j3xnlte

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device_j3xnlte.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := j3xnlte
PRODUCT_NAME := cm_j3xnlte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J320FN
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
