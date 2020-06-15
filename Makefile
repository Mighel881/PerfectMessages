THEOS_DEVICE_IP = iphone
ARCHS = arm64 arm64e
TARGET = iphone:clang:13.2:13.2

INSTALL_TARGET_PROCESSES = MobileSMS

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PerfectMessages
PerfectMessages_FILES = PerfectMessages.xm
PerfectMessages_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
