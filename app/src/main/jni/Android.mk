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

#############################################################################
# libcutils definitions
#############################################################################

LIBCUTILS := system_core/libcutils

libcutils_SRC_FILES := \
	$(LIBCUTILS)/atomic.c.arm \
	$(LIBCUTILS)/config_utils.c \
	$(LIBCUTILS)/fs_config.c \
	$(LIBCUTILS)/canned_fs_config.c \
	$(LIBCUTILS)/hashmap.c \
	$(LIBCUTILS)/iosched_policy.c \
	$(LIBCUTILS)/load_file.c \
	$(LIBCUTILS)/native_handle.c \
	$(LIBCUTILS)/open_memstream.c \
	$(LIBCUTILS)/process_name.c \
	$(LIBCUTILS)/record_stream.c \
	$(LIBCUTILS)/sched_policy.c \
	$(LIBCUTILS)/sockets.cpp \
	$(LIBCUTILS)/strdup16to8.c \
	$(LIBCUTILS)/strdup8to16.c \
	$(LIBCUTILS)/strlcpy.c \
	$(LIBCUTILS)/threads.c \
	$(LIBCUTILS)/fs.c \
    $(LIBCUTILS)/multiuser.c \
    $(LIBCUTILS)/socket_inaddr_any_server_unix.c \
    $(LIBCUTILS)/socket_local_client_unix.c \
    $(LIBCUTILS)/socket_local_server_unix.c \
	$(LIBCUTILS)/socket_loopback_client_unix.c \
	$(LIBCUTILS)/socket_loopback_server_unix.c \
	$(LIBCUTILS)/socket_network_client_unix.c \
	$(LIBCUTILS)/sockets_unix.cpp \
	$(LIBCUTILS)/str_parms.c \
	$(LIBCUTILS)/android_reboot.c \
	$(LIBCUTILS)/debugger.c \
	$(LIBCUTILS)/klog.c \
	$(LIBCUTILS)/partition_utils.c \
	$(LIBCUTILS)/properties.c \
	$(LIBCUTILS)/qtaguid.c \
	$(LIBCUTILS)/trace-dev.c \
	$(LIBCUTILS)/uevent.c

# libcutils_SRC_FILES := \
# 	system_core/libcutils/jni/array.c \
# 	system_core/libcutils/jni/hashmap.c \
# 	system_core/libcutils/jni/atomic.c.arm \
# 	system_core/libcutils/jni/native_handle.c \
# 	system_core/libcutils/jni/buffer.c \
# 	system_core/libcutils/jni/socket_inaddr_any_server.c \
# 	system_core/libcutils/jni/socket_local_client.c \
# 	system_core/libcutils/jni/socket_local_server.c \
# 	system_core/libcutils/jni/socket_loopback_client.c \
# 	system_core/libcutils/jni/socket_loopback_server.c \
# 	system_core/libcutils/jni/socket_network_client.c \
# 	system_core/libcutils/jni/config_utils.c \
# 	system_core/libcutils/jni/cpu_info.c \
# 	system_core/libcutils/jni/load_file.c \
# 	system_core/libcutils/jni/open_memstream.c \
# 	system_core/libcutils/jni/strdup16to8.c \
# 	system_core/libcutils/jni/strdup8to16.c \
# 	system_core/libcutils/jni/record_stream.c \
# 	system_core/libcutils/jni/process_name.c \
# 	system_core/libcutils/jni/properties.c \
# 	system_core/libcutils/jni/threads.c \
# 	system_core/libcutils/jni/sched_policy.c \
# 	system_core/libcutils/jni/iosched_policy.c \
# 	system_core/libcutils/jni/str_parms.c \
# 	system_core/libcutils/jni/abort_socket.c \
# 	system_core/libcutils/jni/selector.c \
# 	system_core/libcutils/jni/tztime.c \
# 	system_core/libcutils/jni/zygote.c \
# 	system_core/libcutils/jni/ashmem-dev.c \
# 	system_core/libcutils/jni/mq.c \
# 	system_core/libcutils/jni/uevent.c
  
# ifeq ($(TARGET_ARCH),arm)
# libcutils_SRC_FILES += system_core/libcutils/jni/arch-arm/memset32.S
# else  # !arm
# ifeq ($(TARGET_ARCH),sh)
# libcutils_SRC_FILES += system_core/libcutils/jni/memory.c system_core/libcutils/jni/atomic-android-sh.c
# else  # !sh
# ifeq ($(TARGET_ARCH_VARIANT),x86-atom)
# libcutils_CFLAGS += -DHAVE_MEMSET16 -DHAVE_MEMSET32
# libcutils_SRC_FILES += system_core/libcutils/jni/arch-x86/android_memset16.S system_core/libcutils/jni/arch-x86/android_memset32.S system_core/libcutils/jni/memory.c
# else # !x86-atom
# libcutils_SRC_FILES += system_core/libcutils/jni/memory.c
# endif # !x86-atom
# endif # !sh
# endif # !arm

ifeq ($(TARGET_CPU_SMP),true)
    libcutils_targetSmpFlag := -DANDROID_SMP=1
else
    libcutils_targetSmpFlag := -DANDROID_SMP=0
endif

libcutils_CFLAGS += $(libcutils_targetSmpFlag)
libcutils_CFLAGS += -DHAVE_PTHREADS -DHAVE_SCHED_H -DHAVE_SYS_UIO_H -DHAVE_ANDROID_OS -DHAVE_IOCTL -DHAVE_TM_GMTOFF
libcutils_C_INCLUDES := $(LOCAL_PATH)/system_core/include/

#############################################################################
# libutils definitions
#############################################################################

LIBUTILS = system_core/libutils

libutils_SRC_FILES := \
	$(LIBUTILS)/CallStack.cpp \
	$(LIBUTILS)/FileMap.cpp \
	$(LIBUTILS)/JenkinsHash.cpp \
	$(LIBUTILS)/LinearTransform.cpp \
	$(LIBUTILS)/Log.cpp \
	$(LIBUTILS)/NativeHandle.cpp \
	$(LIBUTILS)/Printer.cpp \
	$(LIBUTILS)/PropertyMap.cpp \
	$(LIBUTILS)/RefBase.cpp \
	$(LIBUTILS)/SharedBuffer.cpp \
	$(LIBUTILS)/Static.cpp \
	$(LIBUTILS)/StopWatch.cpp \
	$(LIBUTILS)/String8.cpp \
	$(LIBUTILS)/String16.cpp \
	$(LIBUTILS)/SystemClock.cpp \
	$(LIBUTILS)/Threads.cpp \
	$(LIBUTILS)/Timers.cpp \
	$(LIBUTILS)/Tokenizer.cpp \
	$(LIBUTILS)/Unicode.cpp \
	$(LIBUTILS)/VectorImpl.cpp \
	$(LIBUTILS)/misc.cpp 

#############################################################################
# aapt definitions
#############################################################################

aapt_SRC_FILES := \
    aapt/AaptAssets.cpp \
    aapt/AaptConfig.cpp \
    aapt/AaptUtil.cpp \
    aapt/AaptXml.cpp \
    aapt/ApkBuilder.cpp \
    aapt/Command.cpp \
    aapt/CrunchCache.cpp \
    aapt/FileFinder.cpp \
    aapt/Images.cpp \
    aapt/Package.cpp \
    aapt/pseudolocalize.cpp \
    aapt/Resource.cpp \
    aapt/ResourceFilter.cpp \
    aapt/ResourceIdCache.cpp \
    aapt/ResourceTable.cpp \
    aapt/SourcePos.cpp \
    aapt/StringPool.cpp \
    aapt/WorkQueue.cpp \
    aapt/XMLNode.cpp \
    aapt/ZipEntry.cpp \
    aapt/ZipFile.cpp

aapt_C_INCLUDES := aapt

#############################################################################
# androidfw definitions
#############################################################################

androidfw_SRC_FILES := \
    androidfw/Asset.cpp \
    androidfw/AssetDir.cpp \
    androidfw/AssetManager.cpp \
    androidfw/LocaleData.cpp \
    androidfw/misc.cpp \
    androidfw/ObbFile.cpp \
    androidfw/ResourceTypes.cpp \
    androidfw/StreamingZipInflater.cpp \
    androidfw/TypeWrappers.cpp \
    androidfw/ZipFileRO.cpp \
    androidfw/ZipUtils.cpp

#############################################################################
# base definitions
#############################################################################

BASE = system_core/base
base_SRC_FILES := \
    $(BASE)/file.cpp \
    $(BASE)/logging.cpp \
    $(BASE)/parsenetaddress.cpp \
    $(BASE)/stringprintf.cpp \
    $(BASE)/strings.cpp \
    $(BASE)/test_utils.cpp \
	$(BASE)/errors_unix.cpp

base_C_INCLUDES = $(BASE)/include

#############################################################################
# libziparchive definitions
#############################################################################

LIBZIPARCHIVE := system_core/libziparchive

libziparchive_SRC_FILES := \
    $(LIBZIPARCHIVE)/zip_archive.cc \
    $(LIBZIPARCHIVE)/zip_archive_stream_entry.cc \
    $(LIBZIPARCHIVE)/zip_writer.cc

#############################################################################
# safeiop definitions
#############################################################################

safeiop_SRC_FILES := safe-iop/src/safe_iop.c
safeiop_C_INCLUDES := safe-iop/include

include $(CLEAR_VARS)

LOCAL_MODULE:= libaaptcomplete

LOCAL_SRC_FILES += $(safeiop_SRC_FILES)
LOCAL_SRC_FILES += $(libpng_SRC_FILES)
LOCAL_SRC_FILES += $(expat_SRC_FILES)
LOCAL_SRC_FILES += $(libcutils_SRC_FILES)
LOCAL_SRC_FILES += $(libutils_SRC_FILES)
LOCAL_SRC_FILES += $(androidfw_SRC_FILES)
LOCAL_SRC_FILES += $(base_SRC_FILES)
LOCAL_SRC_FILES += $(libziparchive_SRC_FILES)
LOCAL_SRC_FILES += $(aapt_SRC_FILES)

LOCAL_C_INCLUDES += $(safeiop_C_INCLUDES)
LOCAL_C_INCLUDES += $(libpng_C_INCLUDES)
LOCAL_C_INCLUDES += $(expat_C_INCLUDES)
LOCAL_C_INCLUDES += $(libcutils_C_INCLUDES)
LOCAL_C_INCLUDES += $(base_C_INCLUDES)
LOCAL_C_INCLUDES += $(aapt_C_INCLUDES)
LOCAL_C_INCLUDES += include/

LOCAL_CFLAGS += -DHAVE_MEMMOVE -DHAVE_ENDIAN_H -DHAVE_ANDROID_OS -DHAVE_PTHREADS -DHAVE_SYS_UIO_H -DHAVE_POSIX_FILEMAP -DHAVE_ENDIAN_H -DHAVE_ANDROID_OS -DHAVE_PTHREADS -DHAVE_SYS_UIO_H -DHAVE_POSIX_FILEMAP
LOCAL_CPPFLAGS += -std=c++11 -DHAVE_MEMMOVE -DHAVE_ENDIAN_H -DHAVE_ANDROID_OS -DHAVE_PTHREADS -DHAVE_SYS_UIO_H -DHAVE_POSIX_FILEMAP -DHAVE_ENDIAN_H -DHAVE_ANDROID_OS -DHAVE_PTHREADS -DHAVE_SYS_UIO_H -DHAVE_POSIX_FILEMAP

LOCAL_LDLIBS += -lz -llog

# Building a commandline executable for Android
# include $(BUILD_EXECUTABLE)

# Building a shared library for Android
include $(BUILD_SHARED_LIBRARY)