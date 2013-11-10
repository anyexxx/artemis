LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dcpp_shared

LOCAL_MODULE_FILENAME := libcocos2dcpp


#1 �����������cpp�ļ��ĺ�  
define all-cpp-files-under  
$(patsubst ./%,%, $(shell find $(LOCAL_PATH) -name "platform" -prune -o -name "*.cpp" -and -not -name ".*"))  
endef  
  
define all-subdir-cpp-files  
$(call all-cpp-files-under,.)  
endef  
  
#2 �����������c�ļ��ĺ꣬android��Ĭ�϶��壬�˴�������ʡ��  
define all-c-files-under  
$(patsubst ./%,%, $(shell find $(LOCAL_PATH) -name "platform" -prune -o -name "*.c" -and -not -name ".*"))  
endef  
  
define all-subdir-c-files  
$(call all-c-files-under,.)  
endef  
  
#3 ͨ�����һ�ȡ���й����ļ��б�  
CPP_FILE_LIST := $(call all-subdir-cpp-files) \
                $(wildcard $(LOCAL_PATH)/../../Classes/*.cpp)
				
C_FILE_LIST := $(call all-subdir-c-files)  
  
#4 ���빤���ļ���֮���Բ�ֱ�Ӽ�����Ҫ����һ��LOCAL_PATH���滻  
LOCAL_SRC_FILES := hellocpp/main.cpp
LOCAL_SRC_FILES += $(CPP_FILE_LIST:$(LOCAL_PATH)/%=%)   
LOCAL_SRC_FILES += $(C_FILE_LIST:$(LOCAL_PATH)/%=%)   
					   
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes

LOCAL_WHOLE_STATIC_LIBRARIES += cocos2dx_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocosdenshion_static
LOCAL_WHOLE_STATIC_LIBRARIES += box2d_static
LOCAL_WHOLE_STATIC_LIBRARIES += chipmunk_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_extension_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos2dxandroid_static
LOCAL_WHOLE_STATIC_LIBRARIES += artemis_static

include $(BUILD_SHARED_LIBRARY)

$(call import-module, cocos2dx)
$(call import-module, cocos2dx/platform/third_party/android/prebuilt/libcurl)
$(call import-module, CocosDenshion/android)
$(call import-module, extensions)
$(call import-module, external/Box2D)
$(call import-module, external/chipmunk)
$(call import-module, cocos2dx/platform/android)
$(call import-module, Artemis-Cpp)
