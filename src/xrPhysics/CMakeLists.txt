project(xrPhysics)

list(APPEND DIRS
    "."
    "tri-colliderknoopc"
    "dcylinder"
    )

add_dir("${DIRS}")

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../../Externals/ode/include
    ${CMAKE_CURRENT_SOURCE_DIR}/../../Externals
    ${SDL_INCLUDE_DIRS}
    )

list(APPEND ${PROJECT_NAME}__SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/../xrServerEntities/PHNetState.cpp")
list(APPEND ${PROJECT_NAME}__INCLUDES "${CMAKE_CURRENT_SOURCE_DIR}/../xrServerEntities/PHNetState.h")

list(REMOVE_ITEM ${PROJECT_NAME}__SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/tri-colliderknoopc/dcTriListCollider.cpp")
#list(REMOVE_ITEM ${PROJECT_NAME}__INCLUDES "${CMAKE_CURRENT_SOURCE_DIR}/./xr_cda.h")

add_definitions(-DXRPHYSICS_EXPORTS)
add_library(${PROJECT_NAME} SHARED ${${PROJECT_NAME}__SOURCES} ${${PROJECT_NAME}__INCLUDES})

set_target_properties(${PROJECT_NAME} PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "StdAfx.h")

if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "aarch64")
    message( "Disable cotire for aarch64" )
else()
    cotire(${PROJECT_NAME})
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
target_link_libraries(${PROJECT_NAME} xrCore xrMiscMath ODE xrScriptEngine xrAPI xrCDB xrSound)

install(TARGETS ${PROJECT_NAME} LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} PERMISSIONS OWNER_READ OWNER_WRITE 
    GROUP_READ 
    WORLD_READ )

