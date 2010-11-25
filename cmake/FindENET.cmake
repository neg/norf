
find_path(ENET_INCLUDE_DIR enet/enet.h /usr/include /usr/local/include)
find_library(ENET_LIBRARY NAMES libenet enet PATH /usr/lib /usr/local/lib )

include("${CMAKE_ROOT}/Modules/FindPackageHandleStandardArgs.cmake")
find_package_handle_standard_args(ENET ENET_LIBRARY ENET_INCLUDE_DIR)

mark_as_advanced(ENET_INCLUDE_DIR ENET_LIBRARY )
