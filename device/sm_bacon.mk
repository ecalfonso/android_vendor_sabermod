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

# Sabermod configs
TARGET_SM_KERNEL := 5.2
BACON_THREADS := 4
PRODUCT_THREADS := $(BACON_THREADS)
LOCAL_STRICT_ALIASING := false
export LOCAL_O3 := true

GRAPHITE_KERNEL_FLAGS := \
  -fopenmp

# General flags for gcc 4.9 to allow compilation to complete.
MAYBE_UNINITIALIZED := \
  hwcomposer.msm8974

# Extra SaberMod GCC C flags for arch target and Kernel
EXTRA_SABERMOD_GCC_VECTORIZE := \
  -mvectorize-with-neon-quad
