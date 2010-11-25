cmake_minimum_required(VERSION 2.6)

include_directories(
	../inc
	${CMAKE_CURRENT_BINARY_DIR} # for moc srcs
)

file (GLOB src *.cpp)
file (GLOB inc ../inc/*.h)

set(target enet++)

add_library(${target} ${src} ${inc})
#target_link_libraries(${target} ...enet...)

#add_subdirectory(unittest)
