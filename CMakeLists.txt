cmake_minimum_required(VERSION 3.16.3)
project (xlcpp.HelloDjinni)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)


include(CTest)
enable_testing()

find_package(JNI REQUIRED)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)
include(cmake/djinni_process_idl.cmake)

djinni_process_idl(
  DJINNI_IDL_FILE idl/storage.djinni
  GENARATED_OUT_DIR generated
  VARIABLE_PREFIX DJINI_STORAGE
  NAMESPACE cpplib::djinni
  JAVA_PACKAGE dev.xlcpp.djinni.hello
)


include(${CMAKE_CURRENT_BINARY_DIR}/storage.djinni.cmake)


find_package(djinni-support-lib)

add_library(storage
    # all genearted headers
    ${DJINI_STORAGE_CPP_SOURCE}
    ${DJINI_STORAGE_JNI_SOURCE}
    ${DJINI_STORAGE_OBJC_SOURCE}
    ${DJINI_STORAGE_OBJCPP_SOURCE}
    # until source groups added
    ${DJINI_STORAGE_OBJC_HEADER}
    ${DJINI_STORAGE_JNI_HEADER}
    ${DJINI_STORAGE_CPP_HEADER}
    # our implementation
    src/storage.cpp
)

target_include_directories(storage PUBLIC generated/include)
target_include_directories(storage PRIVATE ${JNI_INCLUDE_DIRS})
target_compile_options(storage PRIVATE -fobjc-arc)
target_link_libraries(storage PUBLIC djinni-support-lib::djinni-support-lib ${JNI_LIBRARIES})

add_subdirectory(tests)

