cmake_minimum_required (VERSION 2.6)

#same
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib")

set(TEST_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/test")
set(UNITTEST_PREFIX "unittest_")

make_directory(${TEST_OUTPUT_DIRECTORY})

macro(add_unittest)
	add_executable(${ARGV})
	set_target_properties(${ARGV0} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${TEST_OUTPUT_DIRECTORY})
	add_test(${ARGV0} ${TEST_OUTPUT_DIRECTORY}/${ARGV0})
endmacro()

macro(cpp2moc)
	set(files ${ARGV})
	list(REMOVE_AT files 0)
	foreach(file ${files})
		string(REGEX REPLACE ".cpp" ".moc" mocfile ${file})
		file(RELATIVE_PATH mocfile ${CMAKE_CURRENT_SOURCE_DIR} ${mocfile})
		set(mocfile ${CMAKE_CURRENT_BINARY_DIR}/${mocfile})
		qt4_generate_moc(${file} ${mocfile})
		list(APPEND ${ARGV0} ${mocfile})
	endforeach()
endmacro()

add_definitions("-O2")

project(enet++)

ENABLE_TESTING()

if(${CMAKE_SYSTEM_NAME} MATCHES Linux)
	set(CMAKE_CXX_FLAGS "-g -Wall")
	add_subdirectory(src)
else()
	message("Skipping ${PROJECT_NAME} because not on Linux")
endif()
