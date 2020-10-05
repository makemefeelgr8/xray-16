project(xrMiscMath)

list(APPEND DIRS
    "."
    )

add_dir("${DIRS}")

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/../..
    ${SDL_INCLUDE_DIRS}
    )

#list(REMOVE_ITEM ${PROJECT_NAME}__SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/./LevelCompilerLoggerWindow.cpp")
#ist(REMOVE_ITEM ${PROJECT_NAME}__INCLUDES "${CMAKE_CURRENT_SOURCE_DIR}/./LevelCompilerLoggerWindow.hpp")

add_library(${PROJECT_NAME} STATIC ${${PROJECT_NAME}__SOURCES} ${${PROJECT_NAME}__INCLUDES})
set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)

set_target_properties(${PROJECT_NAME} PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "pch.hpp")

if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "aarch64")
    message( "Disable cotire for aarch64" )
else()
    cotire(${PROJECT_NAME})
endif()

