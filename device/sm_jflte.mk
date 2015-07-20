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

# Find host os
UNAME := $(shell uname -s)

ifeq ($(strip $(UNAME)),Linux)
  HOST_OS := linux
endif

# Only use these compilers on linux host.
ifeq ($(strip $(HOST_OS)),linux)

  # Sabermod configs
  TARGET_SM_AND := 4.8
  TARGET_SM_KERNEL := 4.9
  JFLTE_THREADS := 4
  PRODUCT_THREADS := $(JFLTE_THREADS)
  LOCAL_STRICT_ALIASING := false
  export LOCAL_O3 := true

  GRAPHITE_KERNEL_FLAGS := \
    -fopenmp

  LOCAL_DISABLE_GRAPHITE := \
    libncurses

  LOCAL_DISABLE_O3 := \
    libminshacrypt \
    libFraunhoferAAC
endif

# Extra SaberMod GCC C flags for arch target and Kernel
export EXTRA_SABERMOD_GCC_VECTORIZE := \
         -ftree-vectorize \
         -mvectorize-with-neon-quad

ifeq ($(strip $(LOCAL_STRICT_ALIASING)),true)

  # Flag for strict-aliasing on jf kernel
  # It doesn't work at all, or needs a lot of time to make it work
  # export CONFIG_MACH_MSM8960_JFLTE_STRICT_ALIASING := y

  DISABLE_STRICT := \
    libmmcamera_interface\
    camera.msm8960 \
    gatt_testtool

  # Check if something is already set in configs/sm.mk
  ifndef LOCAL_DISABLE_STRICT_ALIASING
    LOCAL_DISABLE_STRICT_ALIASING := \
      $(DISABLE_STRICT)
  else
    LOCAL_DISABLE_STRICT_ALIASING += \
      $(DISABLE_STRICT)
  endif
endif
