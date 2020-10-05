project(xrCDB)

list(APPEND DIRS
    "."
    )

add_dir("${DIRS}")

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_SOURCE_DIR}/Externals
    ${SDL_INCLUDE_DIRS}
    )

add_definitions(-DXRCDB_EXPORTS)
add_library(${PROJECT_NAME} SHARED ${${PROJECT_NAME}__SOURCES} ${${PROJECT_NAME}__INCLUDES})

set_target_properties(${PROJECT_NAME} PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "stdafx.h")

if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "aarch64")
    message( "Disable cotire for aarch64" )
else()
    cotire(${PROJECT_NAME})
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
target_link_libraries(${PROJECT_NAME} xrCore xrMiscMath OPCODE xrAPI ${SDL_LIBRARIES})

install(TARGETS ${PROJECT_NAME} LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} PERMISSIONS OWNER_READ OWNER_WRITE 
    GROUP_READ 
    WORLD_READ )
