cmake_minimum_required(VERSION 3.18)

project (test-clangcl)

if(MSVC AND CMAKE_JS_NODELIB_DEF AND CMAKE_JS_NODELIB_TARGET)
  # Generate node.lib
  execute_process(COMMAND ${CMAKE_LINKER} /def:${CMAKE_JS_NODELIB_DEF} /out:${CMAKE_JS_NODELIB_TARGET} ${CMAKE_STATIC_LINKER_FLAGS})
endif()

file(GLOB SOURCE_FILES "*.cc" "*.c" "*.h")
add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES} ${CMAKE_JS_SRC})
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "" SUFFIX ".node")
target_include_directories(${PROJECT_NAME}
PUBLIC ${CMAKE_JS_INC})
target_link_libraries(${PROJECT_NAME}  ${CMAKE_JS_LIB} )
set_target_properties(${PROJECT_NAME}  PROPERTIES LINKER_LANGUAGE CXX)
