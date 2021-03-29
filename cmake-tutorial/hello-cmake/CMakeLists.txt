cmake_minimum_required(VERSION 3.5)

project(hello_library)

# cmake .. -DCMAKE_INSTALL_PREFIX=../install

if( CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT )
  message(STATUS "Setting default CMAKE_INSTALL_PREFIX path to ${CMAKE_BINARY_DIR}/install")
  set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE STRING "The path to use for make install" FORCE)
endif()
############################################################
# Create a library
###########################################################

#Generate the static library from the library sources
# add_library(hello_library STATIC 
#     src/Hello.cpp
# )

#Generate the shared library from the library sources
add_library(hello_library SHARED 
    src/Hello.cpp
)
add_library(hello::library ALIAS hello_library)

target_include_directories(hello_library
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)


############################################################
# Create an executable
############################################################

# Add an executable with the above sources
add_executable(hello_binary
    src/main.cpp
)

# link the new hello_library target with the hello_binary target
# target_link_libraries( hello_binary
#     PRIVATE 
#         hello_library
# )
# link the new hello_library target with the hello_binary target
target_link_libraries( hello_binary
    PRIVATE 
        hello::library
)

# install

install (TARGETS hello_binary
    DESTINATION bin)

install (TARGETS hello_library
    LIBRARY DESTINATION lib)

# Header files
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ 
    DESTINATION include)

# Config
install (FILES cmake-examples.conf
    DESTINATION etc)