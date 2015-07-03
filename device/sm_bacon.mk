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
  TARGET_SM_KERNEL := 5.1
  TARGET_SM_AND := 4.9
  BACON_THREADS := 4
  PRODUCT_THREADS := $(BACON_THREADS)
  LOCAL_STRICT_ALIASING := true
  export LOCAL_O3 := true

  GRAPHITE_KERNEL_FLAGS := \
    -fopenmp
endif

# General flags for gcc 4.9 to allow compilation to complete.
MAYBE_UNINITIALIZED := \
  hwcomposer.msm8974

# Extra SaberMod GCC C flags for arch target and Kernel
EXTRA_SABERMOD_GCC_VECTORIZE := \
  -mvectorize-with-neon-quad

ifeq ($(strip $(LOCAL_STRICT_ALIASING)),true)

  # Enable strict-aliasing kernel flags
  export CONFIG_MACH_MSM8974_HAMMERHEAD_STRICT_ALIASING := y

  # Check if something is already set in product/sm_products.mk
  ifndef LOCAL_DISABLE_STRICT_ALIASING
    LOCAL_DISABLE_STRICT_ALIASING := \
      libmmcamera_interface\
  else
    LOCAL_DISABLE_STRICT_ALIASING += \
      libmmcamera_interface\
  endif
endif
endif
