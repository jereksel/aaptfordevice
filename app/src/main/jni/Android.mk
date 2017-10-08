LOCAL_PATH:= $(call my-dir)

#############################################################################
# libpng definitions
#############################################################################
libpng_SRC_FILES := \
	libpng/png.c \
	libpng/pngerror.c \
	libpng/pngget.c \
	libpng/pngmem.c \
	libpng/pngpread.c \
	libpng/pngread.c \
	libpng/pngrio.c \
	libpng/pngrtran.c \
	libpng/pngrutil.c \
	libpng/pngset.c \
	libpng/pngtrans.c \
	libpng/pngwio.c \
	libpng/pngwrite.c \
	libpng/pngwtran.c \
	libpng/pngwutil.c

libpng_C_INCLUDES := $(LOCAL_PATH)/libpng

#############################################################################
# expat definitions
#############################################################################
expat_SRC_FILES := \
	expat/lib/xmlparse.c \
	expat/lib/xmlrole.c \
	expat/lib/xmltok.c

expat_CFLAGS += -DHAVE_EXPAT_CONFIG_H
expat_C_INCLUDES := $(LOCAL_PATH)/expat/lib



include $(CLEAR_VARS)

LOCAL_MODULE:= libaaptcomplete

LOCAL_SRC_FILES += $(libpng_SRC_FILES)
LOCAL_SRC_FILES += $(expat_SRC_FILES)

LOCAL_C_INCLUDES += $(libpng_C_INCLUDES)
LOCAL_C_INCLUDES += $(expat_C_INCLUDES)

LOCAL_CFLAGS += -DHAVE_MEMMOVE -DHAVE_ENDIAN_H -DHAVE_ANDROID_OS -DHAVE_PTHREADS -DHAVE_SYS_UIO_H -DHAVE_POSIX_FILEMAP -DHAVE_ENDIAN_H -DHAVE_ANDROID_OS -DHAVE_PTHREADS -DHAVE_SYS_UIO_H -DHAVE_POSIX_FILEMAP

LOCAL_LDLIBS += -lz -llog

# Building a commandline executable for Android
# include $(BUILD_EXECUTABLE)

# Building a shared library for Android
include $(BUILD_SHARED_LIBRARY)