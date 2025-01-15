# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

include vendor/neutron/configs/BoardConfigKernel.mk

include vendor/neutron/configs/BoardConfigSoong.mk

include device/qcom/sepolicy_vndr/SEPolicy.mk

# Qualcomm Common
$(call inherit-product, device/qcom/common/common.mk)
include device/qcom/common/BoardConfigQcom.mk
