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

# Device specific Sabermod configs
TARGET_SM_AND := 4.8
TARGET_SM_KERNEL := 5.2
JFLTE_THREADS := 4
PRODUCT_THREADS := $(JFLTE_THREADS)
LOCAL_STRICT_ALIASING := true
export LOCAL_O3 := true

# Configs for ROM on GCC 4.8
ifeq ($(strip $(TARGET_SM_AND)),4.8)
  $(warning Applied GCC4.8 ROM configs)
  LOCAL_DISABLE_GRAPHITE := \
    libncurses

  LOCAL_DISABLE_O3 := \
    libminshacrypt \
    libFraunhoferAAC

  NO_OPTIMIZATIONS := \
    libFraunhoferAAC
endif

# Configs for ROM on GCC 4.9
ifeq ($(strip $(TARGET_SM_AND)),4.9)
  $(warning Applied GCC4.9 ROM configs)

endif

ifneq ($(filter 5.1 5.2 6.0,$(TARGET_SM_KERNEL)),)
  $(warning Applied GCC5.1/6.0 Kernel configs)
  GRAPHITE_KERNEL_FLAGS := \
    -fopenmp
endif

# Extra SaberMod GCC C flags for arch target and Kernel
export EXTRA_SABERMOD_GCC_VECTORIZE := \
         -mvectorize-with-neon-quad

ifeq ($(strip $(LOCAL_STRICT_ALIASING)),true)
  $(warning Applied Strict configs)

  # Disable lists for GCC4.8/4.9
  ifeq ($(strip $(TARGET_SM_AND)),4.8)
    DISABLE_STRICT := \
      gatt_testtool
  endif

  ifeq ($(strip $(TARGET_SM_AND)),4.9)
    DISABLE_STRICT := \

  endif

  # Check if something is already set in configs/sm.mk
  ifndef LOCAL_DISABLE_STRICT_ALIASING
    LOCAL_DISABLE_STRICT_ALIASING := \
      $(DISABLE_STRICT)
  else
    LOCAL_DISABLE_STRICT_ALIASING += \
      $(DISABLE_STRICT)
  endif
endif
