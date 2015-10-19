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

#######################################################
#
# Device specific Sabermod configs
#
#######################################################
TARGET_SM_AND 	 := 4.8
TARGET_SM_KERNEL := 4.9
JFLTE_THREADS 	 := 4
PRODUCT_THREADS  := $(JFLTE_THREADS)

#######################################################
#
# Enable/Disable optimizations
#
#######################################################
LOCAL_STRICT_ALIASING 	:= true
LOCAL_O3 		:= true
DISABLE_O3_KERNEL 	:= false

#######################################################
#
# Enable prebuilt APKs
#
#######################################################
PREBUILT_FIREFOX := false
PREBUILT_SUPERSU := false

#######################################################
#
# GCC 4.8 Toolchain configurations
#
#######################################################
ifeq ($(strip $(TARGET_SM_AND)),4.8)
LOCAL_DISABLE_O3 := \
	libminshacrypt \
	libFraunhoferAAC

NO_OPTIMIZATIONS := \
	libFraunhoferAAC

ifeq ($(strip $(LOCAL_STRICT_ALIASING)),true)
LOCAL_DISABLE_STRICT_ALIASING := \
	gatt_testtool

LOCAL_DISABLE_GRAPHITE := \
	libncurses
endif
endif 

#######################################################
#
# GCC 4.9 Toolchain configurations
#
#######################################################
ifeq ($(strip $(TARGET_SM_AND)),4.9)

ifeq ($(strip $(LOCAL_STRICT_ALIASING)),true)
LOCAL_DISABLE_STRICT_ALIASING  := \
	gatt_testtool

LOCAL_DISABLE_GRAPHITE := \
	libncurses
endif
endif

#######################################################
#
# Kernel Configuration
#
#######################################################
GRAPHITE_KERNEL_FLAGS := \
	-fopenmp

#######################################################
#
# Extra SaberMod GCC C flags for arch target and Kernel
#
#######################################################
EXTRA_SABERMOD_GCC_VECTORIZE := \
	-mvectorize-with-neon-quad
