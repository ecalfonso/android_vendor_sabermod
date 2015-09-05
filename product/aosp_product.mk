# Copyright (C) 2015 The SaberMod Project
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

# Android ROM toolchain.
# This can still be overridden in device/sm_device.mk
TARGET_SM_AND := 4.9

# Assume that busybox is bundled in with all customized ROMs.
# If need be, there is a fork of cyanogenmod busybox on gitlab, that will work on any ROM build type.
# See https://gitlab.com/SaberMod/android-external-busybox

PRODUCT_PACKAGES += \
  busybox
