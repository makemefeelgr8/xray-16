project(GameSpy)

list(APPEND DIRS
    "./src/GameSpy"
    "./src/GameSpy/common"
    "./src/GameSpy/gcdkey"
    "./src/GameSpy/ghttp"
    "./src/GameSpy/GP"
    "./src/GameSpy/gstats"
    "./src/GameSpy/gt2"
    "./src/GameSpy/natneg"
    "./src/GameSpy/pt"
    "./src/GameSpy/qr2"
    "./src/GameSpy/sake"
    "./src/GameSpy/sc"
    "./src/GameSpy/serverbrowsing"
    "./src/GameSpy/webservices"
    )

add_dir("${DIRS}")

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/../..
    ${SDL_INCLUDE_DIRS}
    )

#list(REMOVE_ITEM ${PROJECT_NAME}__SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/./LevelCompilerLoggerWindow.cpp")
#ist(REMOVE_ITEM ${PROJECT_NAME}__INCLUDES "${CMAKE_CURRENT_SOURCE_DIR}/./LevelCompilerLoggerWindow.hpp")

add_definitions(-D_UNIX -D_LINUX)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-error=format-security")

add_library(${PROJECT_NAME} STATIC ${${PROJECT_NAME}__SOURCES} ${${PROJECT_NAME}__INCLUDES})
set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)

#set_target_properties(${PROJECT_NAME} PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "pch.hpp")
#cotire(${PROJECT_NAME})
